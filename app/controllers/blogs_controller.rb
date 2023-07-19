class BlogsController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, except: [:index, :show]

  def index
    @blogs = Blog.includes(:user)
    @blogs = Blog.all
    @blog = Blog.new
    @total_expenses = Blog.where(start_time: Date.current.beginning_of_month..Date.current.end_of_month).sum(:price)

  end
  
  def new
    @blog = Blog.new
  end

  def show_by_date
    date = Date.parse(params[:date])
    @blogs = Blog.where(start_time: date.beginning_of_day..date.end_of_day)
  
    if @blogs.any?
      render 'show'
    else
      redirect_to blogs_path, alert: "選択した日に予定はありませんでした"
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
    #@schedules = @blog.schedules
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
    @blog.price = params[:blog][:price]
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end
  

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time, :price).merge(user_id: current_user.id)
  end
  

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end