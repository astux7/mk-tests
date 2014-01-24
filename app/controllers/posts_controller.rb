class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create params[:post].permit(:title, :content)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
    render 'index'
  end
end
