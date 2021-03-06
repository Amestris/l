module L
  module Concerns
    module MassActions
      extend ActiveSupport::Concern

      class Selection
        attr_reader :action, :klass

        def initialize(klass, opts = {})
          @klass = klass
          @action = opts[:action].try :to_sym
          @ids = [*opts[:ids]].compact
          objects
        end

        def valid?
          @action.in?(klass.mass_actions) and @ids.any?
        end

        def objects
          @objects ||= if klass.respond_to? :with_deleted
            klass.with_deleted.where(id: @ids)
          else
            klass.where(id: @ids)
          end
        end

        delegate :each, :each_with_index, to: :objects

        def perform!
          if valid?
            if klass.respond_to? :"__mass_perform_#{@action}_all"
              ::Rails.logger.debug "[MassActions] Perform #{action} on #{klass.name}(#{@ids.join(', ')})" if ::Rails.env.development?
              klass.where(id: @ids).send :"__mass_perform_#{@action}_all"
            else
              ::Rails.logger.error "[MassActions] Define mass action in class #{klass.name} by calling: define_perfom_action(:#{@action}) do ... end"
            end
          else
            false
          end
        end
      end


      included do
        define_perform_action :destroy do
          destroy_all
        end
      end

      module ClassMethods

        def selection_object(opts = {})
          Selection.new(self, opts)
        end

        def human_mass_action(name)
          I18n.t(name, scope: [:helpers, :mass])
        end

        def mass_actions
          if class_variable_defined? "@@mass_actions"
            class_variable_get "@@mass_actions"
          else
            [:destroy]
          end
        end

        def set_mass_actions(*actions)
          class_variable_set "@@mass_actions", actions
        end

        def mass_actions_for_select(*only)
          only = mass_actions if only.empty?
          (mass_actions & only).map do |n|
            [human_mass_action(n), n]
          end
        end

        def define_perform_action(name, &block)
          (class << self; self; end).send :define_method, :"__mass_perform_#{name}_all", block
        end

      end
    end
  end
end
