class SchedulesController < ApplicationController

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end
  