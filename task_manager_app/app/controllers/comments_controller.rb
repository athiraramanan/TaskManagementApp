class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  respond_to :html, :json

  def edit  
    respond_modal_with @comment
  end

  def update
    @comment.update(comment_params)
    respond_modal_with @comment, location: tasks_path  
  end

  def destroy    
    @comment.destroy   
    redirect_to tasks_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params['id'])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end