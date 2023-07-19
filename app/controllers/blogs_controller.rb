class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user)
    @blogs = Blog.all
    @blog = Blog.new
  end
  
  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_parameter)
  
    if @blog.save
      redirect_to blogs_path, notice: '予定を追加しました。'
    else
      render :new
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end