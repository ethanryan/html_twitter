class TweetsController < ApplicationController

  #before_action :require_login

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save
      redirect_to user_path(tweet.user)
    else
      render 'new'
    end
  end

  # def create #got these from classmate
  #   if password_match?
  #     @tweet = User.new(user_params)
  #     @tweet.save
  #     session[:user_id] = @tweet.id
  #     redirect_to user_path(@tweet)
  #   else
  #     redirect_to new_user_path
  #   end
  # end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end

  # def password_match?
  #   params[:user][:password] == params[:user][:password_confirmation]
  # end

end
