class AccessController < ApplicationController

  def login
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      # Primeiro tenta localizar um Admin
      found_user = User.where(:username => params[:username]).first
      if found_user # se localizado um Admin
        # tenta realizar a autenticação do Admin
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user] = found_user
      session[:user_id] = found_user.id
      redirect_to root_url, notice: 'Login realizado com sucesso'
    else # Caso não encontre um usuario autorizado
      render 'login', notice: 'Combinação de usuário/senha inválida'
    end
  end

  def logout
    session[:user_id] = nil
    session[:user] = nil
    flash[:info] = 'Logged out'
    redirect_to root_path
  end
end
