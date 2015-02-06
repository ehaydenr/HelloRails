class PagesController < ApplicationController

  def home
    @comments = Comment.all
    @new_comment = Comment.new
  end


end
