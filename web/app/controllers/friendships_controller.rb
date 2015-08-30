class FriendshipsController < ApplicationController

  def create
    # binding.pry
    if User.find_by id: session[:user]['uid']
      flash[:notice] = "Пользователь уже есть в вашем списке друзей"
      redirect_to root_url
    else
      @friendship = Friendship.new(:user_id => session[:user]['id'],:friend_id => params[:friend_id])
      if @friendship.save
        flash[:notice] = "Успешно добавлен."
        redirect_to root_url
      else
        flash[:notice] = "Ошибка."
        redirect_to root_url
      end
    end

  end

  def show
  end

  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

end
