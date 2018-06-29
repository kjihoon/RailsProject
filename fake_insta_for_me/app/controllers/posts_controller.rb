class PostsController < ApplicationController

  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: :index
  load_and_authorize_resource #restful 구조로 구성했을때는 이거 한줄로 권한 설정

    def index
    #@posts = Post.all
    #page =1 default
    #@posts =Post.all.page(params[:page]).per(3)
    @posts =Post.order(created_at: :desc).page(params[:page]).per(3)
    respond_to do |format|
      format.html #아무것도 넣지 않으면 controller action명과 동일한것으로 rendering 된다.
      format.json { render json: @posts }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    respond_to do |format|

    # Post.create는 rollback까지 포함되어 new를 사용하여 save 여부 확인
    if @post.save
      #저장이 되었을 경우 실행
      #flash[:notice] = "글 작성이 완료되었습니다."
      #redirect_to "/"
      format.html {redirect_to '/',notice: "작성완료"}

    else
      # 저장이 실패 했을경우(validation에 걸렸을때 실행)
        #flash[:alert] = "글 작성이 실패했습니다."
        #redirect_to new_post_path
          format.html {render :new}
          format.json {render json: @post.errors}
      end
    end
  end

  def show
    @comments = @post.comments
  end

  def edit
    if current_user==@post.user.id

    elsif
      redirect_to '/'
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
      format.html{redirect_to @post,notice: '글 수정완료!'}
    else
      format.html {render :edit}
      format.json {render json: @post.errors}
    end
    end
    #@post.update(post_params)
    #redirect_to "/posts/#{@post.id}"

  end

  def destroy
    @post.destroy
    redirect_to "/"
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
