class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @new_comment = Comment.new
  end

  def new
    @new_comment = Comment.new
  end

  def create 
    @new_comment = Comment.new(comment_params)
    if @new_comment.save
      redirect_to :controller => 'pages', :action => 'home' 
    else
      render('new')
    end
  end

  def edit
  end

  private
  
  def comment_params
    params.require(:comment).permit(:content)
  end
end
