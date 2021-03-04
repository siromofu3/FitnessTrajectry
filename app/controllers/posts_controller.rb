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
    @post = Post.new(
      recording_date: params[:recording_date],
      body_weight: params[:body_weight],
      body_fat_percentage: params[:body_fat_percentage],
      training_menu: params[:training_menu],
      meal_menu: params[:meal_menu],
      total_calorie: params[:total_calorie],
      user_id: @current_user.id,
    )
    if params[:post_image]
      @post.post_image_name = "#{@post.user.name}_#{@post.id}.jpg"
      image = params[:post_image]
      File.binwrite("public/post_images/#{@post.post_image_name}", image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.recording_date = params[:recording_date]
    @post.body_weight = params[:body_weight]
    @post.body_fat_percentage = params[:body_fat_percentage]
    @post.training_menu = params[:training_menu]
    @post.meal_menu = params[:meal_menu]
    @post.total_calorie = params[:total_calorie]

    if params[:post_image]
      @post.post_image_name = "#{@post.id}.jpg"
      image = params[:post_image]
      File.binwrite("public/post_images/#{@post.post_image_name}", image.read)
    end
    
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/#{@post}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    else
      render("posts/#{@post.id}")
    end
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
