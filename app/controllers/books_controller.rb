class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)

    if book.save
        redirect_to book_path(book)
        flash[:success] = "Book was successfully created."
    else
        @books = Book.all
        @book = book
        render 'index'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:success] = "Book was successfully created."
  end


  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    
    if book.update(book_params)
      redirect_to book_path(book.id)
      flash[:success] = "Book was successfully created."
    else
      @book = book
      render 'edit'
    end
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
