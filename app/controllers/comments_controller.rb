class CommentsController < ApplicationController

    def create 
        @comment = current_user.comments.build(comment_params)
        @comment.save
        redirect_to root_path
    end

    private
    
    def comment_params 
        params.require(:comment).permit(:post_id,:comment)
    end
    
end
