class GoalpostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy, :update, :show, :new, :edit]
    before_action :correct_user,   only: [:destroy, :update]

    def new
        @goalpost = current_user.goalposts.build if logged_in?
        if params[:keyword]
            @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
        end
        @i = 0
    end

    def show
        @goalpost = Goalpost.find(params[:id])
        @likes = Like.where(goalpost_id: params[:goalpost_id])
        @comment = Comment.new
        @comments = @goalpost.comments
        @item = RakutenWebService::Ichiba::Item.search(itemCode: @goalpost.reward)
    end

    def create
        @goalpost = current_user.goalposts.build(goalpost_params)
        if @goalpost.save
            flash[:success] = "目標を設定しました"
            redirect_to current_user
        else
            @feed_items = []
            redirect_to '/set'
        end
    end

    def edit
        @goalpost = Goalpost.find(params[:id])
        if params[:keyword]
            @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
        end
        @i = 0
    end

    def update
        @goalpost = Goalpost.find(params[:id])
        if @goalpost.update_attributes(goalpost_params)
            flash[:success] = "プロフィールを変更しました"
            redirect_to @goalpost
        else
            render 'edit'
        end
    end

    def destroy
        @goalpost.destroy
        flash[:success] = "目標が削除されました"
        redirect_to current_user
    end

    def form
        if params[:keyword]
          @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
        end
    end

    private

    def goalpost_params
      params.require(:goalpost).permit(:from, :to, :goal, :comment, :reward)
    end

    def correct_user
        @goalpost = current_user.goalposts.find_by(id: params[:id])
        redirect_to current_user if @goalpost.nil?
      end
end
