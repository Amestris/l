# coding: utf-8
module L
  # Kontroler modułu newslettera.
  #
  # Pozwala na wysyłanie listów do zapisanych osób. Dodawanie, potwierdzanie i
  # usuwanie osób z listy.
  #
  class NewsletterMailsController < ApplicationController
    uses_tinymce :advance, :only => [:send_mail_edit]
    layout "l/layouts/admin"
    
    # Akcja pozwalająca zapisać się do newslettera.
    #
    # *POST* /newsletter_mails
    #
    def create

      @newsletter_mail = L::NewsletterMail.new(params[:l_newsletter_mail])
      authorize! :create, @newsletter_mail

      respond_to do |format|
        if @newsletter_mail.save
          Newsletter.confirmation(@newsletter_mail).deliver
          format.html {
            flash[:newsletter_notice_class] = 'notice'
            flash[:newsletter_notice] = I18n.t('newsletter.added')
            redirect_to :back
          }
          format.js
        else
          format.html {
            flash[:newsletter_notice_class] = 'alert'
            flash[:newsletter_notice] = @newsletter_mail.errors.full_messages.first
            redirect_to :back
          }
          format.js { render action: 'create_error' }
        end
      end
    rescue ActionController::RedirectBackError
      redirect_to root_path
    end

    # Akcja pozwalająca potwierdzi zapisany adres email. Wymagany parametr
    # +token+.
    #
    # *GET* /newsletter_mail/confirm
    #
    def confirm
      @mail = L::NewsletterMail.find_by_confirm_token(params[:token])
      authorize! :create, @mail

      if @mail.try(:confirm)
        flash[:newsletter_notice_class] = 'notice'
        flash[:newsletter_notice] = I18n.t('newsletter.confirmed')
      else
        flash[:newsletter_notice_class] = 'alert'
        flash[:newsletter_notice] = I18n.t('newsletter.error')
      end
      
      redirect_to root_path
    end

    # Akcja wyświetlająca liste zapisanych i potwierdzonych adresów email.
    # Dostępna tylko dla administratora.
    #
    # *GET* /newsletter_mails
    #
    def index
      authorize! :manage, L::NewsletterMail
      @newsletter_mail = L::NewsletterMail
        .ordered
        .where(:confirm_token => nil)
        .paginate page: params[:page]
    end

    # Akcja wyświetlająca formularz nowego listu newslettera. Dostępna tylko
    # dla administratora.
    #
    # *GET* /newsletter_mails/send_mail
    #
    def send_mail_edit
      authorize! :menage, NewsletterMail      
      @emails = L::NewsletterMail.where(:confirm_token => nil).all
    end

    # Akcja sprawdza i wysyła newsleter do wybranych użytkowników. Dostepna
    # tylko dla administratora.
    #
    # *POST* /newsletter_mails/send_mail
    #
    def send_mail
      authorize! :menage, L::NewsletterMail
      if params[:emails].nil?
        flash[:alert] = "Nie wybrano odbiorców."
      else
        params[:emails].each do |email|
          Newsletter.send_mail(email, params[:text]).deliver
        end
        flash[:notice] = "Wysłano."
      end
      respond_to do |format|
        format.html { redirect_to(newsletter_mails_url) }
      end
    end

    # Akcja pozwalająca usunąć adres z listy mailingowej. Dostępna tylko dla
    # administratora.
    #
    # *DELETE* /newsletter_mails/1
    #
    def destroy
      @newsletter_mail = L::NewsletterMail.find(params[:id])
      authorize! :destroy, @newsletter_mail
      @newsletter_mail.destroy

      respond_to do |format|
        format.html { redirect_to(newsletter_mails_url) }
      end
    end

  end
end
