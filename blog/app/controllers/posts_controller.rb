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
    flash[:alert] = "글이 작성되었씁니다."
    redirect_to "/posts/#{post.id}"
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post =Post.find(params[:id])
    post.destroy
    flash[:notice] = "글이 삭제되었씁니다."
    redirect_to "/"

  end
  def editimp
    post = Post.find(params[:id])
    post.title=params[:title]
    post.body=params[:body]
    post.save
    redirect_to '/'
    flash[:alert] = "글이 수정되었습니다."
  end

  def edit
      @post = Post.find(params[:id])
  end
end
