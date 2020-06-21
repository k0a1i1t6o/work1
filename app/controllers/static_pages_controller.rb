class StaticPagesController < ApplicationController
  def top
  end

  def home
      @goalposts = Goalpost.all
      @likes = Like.where(goalpost_id: params[:goalpost_id])
  end
end
