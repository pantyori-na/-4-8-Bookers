class BooksController < ApplicationController

  def index
  	#全体を取得
  	@books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book)
    else
      @book = book
      @books = Book.all
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.update(book_params)
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book)
    else
      @book = book.find(params[:id])
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  # Strong Parametesの定義
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
