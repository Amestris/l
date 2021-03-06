module L
  module Rails # :nodoc:
    class Engine < ::Rails::Engine # :nodoc:

      initializer "i18n" do |app|
        path = Dir[File.join(File.dirname(__FILE__), '../../..', 'rails/locale/*.{rb,yml}')]
        I18n.load_path.concat(path)
      end

      initializer "precompile", :group => :all do |app|
        app.config.assets.precompile += ["jquery.js", "jquery_ujs.js", "admin.js", "admins.js", "admins.css", 'admin/admin_login.css', 'ie8polyfill.js']
        app.config.assets.precompile << "tinymce/skins/lazy/content.min.css"
        app.config.assets.precompile << "tinymce/skins/lazy/content.inline.min.css"
        app.config.assets.precompile << "tinymce/skins/lazy/skin.min.css"
        app.config.assets.precompile << "tinymce/skins/lazy/skin.ie7.min.css"
      end

      initializer "helper" do |app|
        ActiveSupport.on_load(:action_view) do
          include L::LazyHelper
          include L::FilterHelper
          include L::LightboxHelper
          self.parent::Helpers::FormHelper.send(:include, L::FormHelper)
          self.parent::Helpers::FormBuilder.send(:include, L::FormHelper::FormBuilder)

        end
      end

      initializer "form_helper" do |app|
      end

      initializer "controller" do |app|
        ActiveSupport.on_load(:action_controller) do
          include L::Controllers::ExceptionsRescues
          include L::Controllers::GenericInfo
          include L::FilterHelper
        end
      end

      initializer "model" do |app|
        ActiveSupport.on_load(:active_record) do
          include L::Concerns::MassActions
          include L::Concerns::Sortable
          include L::Concerns::Roles
          include L::Concerns::Filtering
        end
      end

      initializer "string_extension" do |app|
        String.class_eval do
          include L::StringExtension
        end
      end
    end
  end
end
