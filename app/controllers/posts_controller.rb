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
  
  def show
    @post = Post.find params[:id]
  end

  def edit 
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params[:post].permit(:title, :content)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def index
    @posts = Post.all
    render 'index'
  end

  def destroy 
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end
end
