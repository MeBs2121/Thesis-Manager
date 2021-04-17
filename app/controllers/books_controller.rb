class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = current_user.books.all
  end

  def show
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(books_praams)

    if @book.save
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

    def books_praams
      params.require(:book).permit(:author, :title, :main)
    end
end
