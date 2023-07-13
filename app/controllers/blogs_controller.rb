class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
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
      redirect_to blogs_path, alert: "No blogs found for the selected date."
    end
  end
  
  

  
  def show
    @blog = Blog.find(params[:id])
    #@schedules = @blog.schedules
  end
  


  def create
    Blog.create(blog_parameter)
    redirect_to blogs_path
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

end