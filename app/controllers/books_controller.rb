class BooksController < ApplicationController
  def index
  	#全体を取得
  	@books = Book.all
  end

  def show
  end

  def new
  	@blog = Book.new
  end

  def create
  end

  def edit
  end
end
