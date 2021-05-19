class UsersController < ApplicationController
 
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}


  def index
    @users = User.all
  end
  

  def show
    @user = User.find(params[:id])
    
    if @user.gender == "1"
      @user_gender = "男性"
    else
      @user_gender = "女性"
    end

    @age = @user.age
    @posts = Post.where(user_id: @user.id).order(recording_date: "desc")
    @chart_weight_dates = []
    @posts.each do |post|
      @chart_weight_dates.push([post.recording_date, post.body_weight])
    end
    @chart_fat_dates = []
    @posts.each do |post|
      @chart_fat_dates.push([post.recording_date, post.body_fat_percentage])
    end
    
    if @posts.count != 0
      @recent_weight = @posts[0].body_weight
      @recent_fat_percentage = @posts[0].body_fat_percentage
    end  

  end 
  

  def new
    @user = User.new    
  end


  def create
    @user = User.new(user_params)
    @user.description = "理想のカラダを目指して一緒に頑張りましょう！"
    @user.icon_image_name = "default_user_image.jpg"

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to user_path(@user)
    else
      render "users/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.name = user_params[:name]
    @user.email = user_params[:email]
    @user.birthday = user_params[:birthday]
    @user.gender = user_params[:gender]
    @user.user_height = user_params[:user_height]
    @user.description = user_params[:description]

    if user_image[:icon_image] != nil
      @user.icon_image_name = "#{@user.id}.jpg"
      image = user_image[:icon_image]
      File.binwrite("public/user_images/#{@user.icon_image_name}", image.read)
    end
    
    if @user.save
      flash[:notice] = "変更を保存しました"
      redirect_to user_path(@user)
    else
      render "users/edit"
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to user_path(@user)
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render "users/login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to login_path    
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)    

    if @user.gender == "1"
      @user_gender = "男性"
    else
      @user_gender = "女性"
    end

    @age = @user.age
    @posts = Post.where(user_id: @user.id).order(recording_date: "desc")
    @chart_weight_dates = []
    @posts.each do |post|
      @chart_weight_dates.push([post.recording_date, post.body_weight])
    end
    @chart_fat_dates = []
    @posts.each do |post|
      @chart_fat_dates.push([post.recording_date, post.body_fat_percentage])
    end
    
    if @posts.count != 0
      @recent_weight = @posts[0].body_weight
      @recent_fat_percentage = @posts[0].body_fat_percentage
    end  
  end
  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end


  private
  def user_params
    params.require(:user).permit( :name, :email, :birthday,
                                  :gender, :user_height, :description)
  end

  def user_image
    params.require(:user).permit( :icon_image)
  end

end
