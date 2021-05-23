class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(recording_date: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: params[:id]).count
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if post_image[:post_image] != nil 
      @post.post_image_name = "#{@post.user_id}_#{@post.id}.jpg"
      image = post_image[:post_image]
      File.binwrite("public/post_images/#{@post.post_image_name}", image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to posts_path
    else
      render "posts/new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.recording_date = post_params[:recording_date]
    @post.body_weight = post_params[:body_weight]
    @post.body_fat_percentage = post_params[:body_fat_percentage]
    @post.training_menu = post_params[:training_menu]
    @post.meal_menu = post_params[:meal_menu]
    @post.total_calorie = post_params[:total_calorie]
    
    if post_image[:post_image] != nil 
      @post.post_image_name = "#{@current_user.id}_#{@post.id}.jpg"
      image = post_image[:post_image]
      File.binwrite("public/post_images/#{@post.post_image_name}", image.read)
    end
    
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to post_path(@post)
    else
      render "posts/#{@post}/edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to posts_path
    else
      render post_url(@post)
    end
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit( :recording_date, :body_weight,
      :body_fat_percentage, :training_menu,
      :meal_menu, :total_calorie)
  end
    
  def post_image
      params.require(:post).permit( :post_image)
  end

end
