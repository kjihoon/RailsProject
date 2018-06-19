class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    # 두 가지 방법
    #1.
    post =Post.create(title: params[:title], body: params[:body] )
    #1.2
    #Post.create(:title => params[:title], :body => parmas[:body] )
    #2.
    #post = Post.new
    #post.title =  params[:title]
    #post.body = parmas[:body]
    redirect_to "/posts/#{post.id}"
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post =Post.find(params[:id])
    post.destroy
    redirect_to "/"
  end
end
