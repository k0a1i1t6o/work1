class LikesController < ApplicationController
  before_action :set_variables

  def create
    @like = Like.create(user_id: current_user.id, goalpost_id: params[:goalpost_id])
    @likes = Like.where(goalpost_id: params[:goalpost_id])
    @goalpost = Goalpost.find(params[:goalpost_id])
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, goalpost_id: params[:goalpost_id])
    like.destroy
    @likes = Like.where(goalpost_id: params[:goalpost_id])
    @goalpost = Goalpost.find(params[:goalpost_id])
    
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end

  end

  def set_variables
    @goalpost = Goalpost.find(params[:goalpost_id])
    @id_name = "#like-link-#{@goalpost.id}"
  end

end