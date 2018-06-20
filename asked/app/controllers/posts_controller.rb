class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
  end
  def create
    Post.create(title: params[:title], content: params[:content], username: params[:username] )
    redirect_to "/"
  end
  def show
    id = params[:id]
    @post = Post.find(id)
  end
  def edit
    id = params[:id]
    @post = Post.find(id)
  end
  def update
    id = params[:id]
    post= Post.find(id)
    post.title=params[:title]
    post.title=params[:content]
    redirect_to "/"
  end
  def destroy
    id = params[:id]
    Post.find(id).destroy
    redirect_to "/"
  end
end
