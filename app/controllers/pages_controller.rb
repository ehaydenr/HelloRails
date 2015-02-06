class PagesController < ApplicationController

  def home
    @comments = Comment.all
    puts "Hello"
  end

  def home_render
    render :home
  end

end
