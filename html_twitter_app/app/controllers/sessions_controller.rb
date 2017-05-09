class SessionsController < ApplicationController

  def new
    # nothing to do here!
  end

  def create
    user = User.find_by(username: params[:username])
    if user.present?
      #&& user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to users_path
      else
        render 'new'
      end
  end

  # def create
  #   @user = User.find_by(username: params[:username])
  #   authenticate = @user.try(:authenticate, params[:password]) #adding this
  #   return head(:forbidden) unless @user.authenticate(params[:password])
  #   session[:user_id] = @user.id
  # end

  def destroy
    session.delete :username
    redirect_to '/sessions/new' #logout will actually be a submit button that we style to look like a link
  end

end
