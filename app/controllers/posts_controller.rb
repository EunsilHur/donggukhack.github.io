class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  before_action :set_terms, only: [:new, :edit,:index,:search]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5).order("id desc")
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end
    
  # GET /posts/new
  def new
   @post = Post.new
  end
    
  # GET /posts/1/edit
  def edit
    
  end
    
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def search
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5).where(loc: params["loc_rd"],b_type: params["b_type"]).order("id desc")
    @loc_p=params["loc_rd"]
    @type_p=params["b_type"]
    render 'posts/index'
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    def set_terms
      @loc_arr= %w(서울 경기 부산 대구 인천 광주 대전 울산 세종 경남 경북 충남 충북 전남 전북 강원 제주)
      @type_arr= %w(매장관리 서빙 주방 서비스 강사 사무)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :loc ,:b_type)
    end
end
