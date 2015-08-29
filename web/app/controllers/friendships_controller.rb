class FriendshipsController < ApplicationController

  def create
      # binding.pry
    @friendship = Friendship.new(:user_id => session[:user]['id'],:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:notice] = "Unable to add friend."
      redirect_to root_url
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
