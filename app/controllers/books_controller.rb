class BooksController < ApplicationController
  def top
  end
  def index
  	@books=Book.all
  	@book=Book.new
   end
  def create
  	book = Book.new(book_params)
  	if book.save
  	  redirect_to book_path(book.id),notice:"Book was successfully created."
    else
      @book = book
      @books = Book.all
  	  render :index
    end
  end
  def show
  	@book=Book.find(params[:id])

  end

  def edit
  	@book=Book.find(params[:id])
  end
  def update
  	book=Book.find(params[:id])
  	book.update(book_params)
  	redirect_to book_path(book.id),notice:"Book was successfully update."
  end
  def destroy
  	book=Book.find(params[:id])
  	book.destroy
  	redirect_to books_path,notice:"Book was successfully delete."
  end
  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
