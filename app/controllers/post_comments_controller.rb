class PostCommentsController < ApplicationController
   before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_id = @post.id
    if @post_comment.save
    @post.create_notification_post_comment!(current_user, @post_comment.id)
    else
      render 'error'               #入力にエラーが生じた際に表示するエラー内容
    end
  end

  def destroy
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
