class SessionController < ApplicationController

  def create
    @user = User.find_or_create_by(provider: auth_hash['provider'], uid: auth_hash['uid'], name: auth_hash['info']['name'], image: auth_hash['info']['image'])
    if session[:user].blank?
      session[:user] = @user
      data_id_friends = Friendship.where(:user_id => @user['id'])
      arr = []
      data_id_friends.each do |id|
         arr.push(User.find_by id:  id.friend_id )
      end
      session[:friend] = arr
      # binding.pry
      redirect_to '/'
    else
      redirect_to '/'
    end
  end

  def destroy
    # binding.pry
    reset_session
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
