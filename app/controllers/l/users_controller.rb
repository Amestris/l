# coding: utf-8
module L
  access_control do
    allow :admin
  end
  # Kontroler zarządzający uzytkownikami.
  #
  # Pozwal administratorowi na tworzenie, edycję i usuwanie użytkowników. 
  #
  class UsersController < ApplicationController
    layout "l/layouts/admin"

    # Akcja wyświetlająca listę wszystkich zarejestrowanych użytkowników
    #
    # *GET* /users/
    def index
      @users = User.all.paginate :page => params[:page], :per_page => params[:per_page]||10
    end

    # Akcja wyświetlająca informacje o pojedynczym uzytkowniku.
    #
    # *GET* /users/1
    #
    def show
      @user = User.find(params[:id])
    end

    # Akcja wyświetlająca formularz tworzenia nowego użytkownika.
    #
    # *GET* /users/new
    #
    def new
      @user = User.new
    end

    # Akcja wyświetlająca formularz edycji istniejącego użytkownika.
    #
    # *GET* /users/1/edit
    #
    def edit
      @user = User.find(params[:id])
    end

    # Akcja tworząca nowego uzytkwnika.
    #
    # *POST* /users/1
    #
    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to users_path, notice: I18n.t('create.success')
      else
        render :action => :new
      end
    end

    # Akcja aktualizująca istniejącego użytkownika.
    #
    # *PUT* /users/1
    #
    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        redirect_to users_path, notice: I18n.t('update.success')
      else
        render :action => :edit
      end
    end

    # Akcja usuwająca użytkownia.
    #
    # *DELETE* /users/1
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      respond_to do |format|
        format.html { redirect_to :back, notice: t('delete.success') }
        format.js
      end
    end

  end
end