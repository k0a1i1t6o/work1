class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :delete]
  

    def create
        @goalpost = Goalpost.find(params[:goalpost_id])
        @comment = @goalpost.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          render :index
        end
      end
    
    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            render :index
        end
    end
    
      private

        def comment_params
          params.require(:comment).permit(:content, :goalpost_id, :user_id)
        end

        # 正しいユーザーかどうか確認
        def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless current_user?(@user)
        end

        # 管理者かどうか確認
        def admin_user
          redirect_to(root_url) unless current_user.admin?
        end
end
