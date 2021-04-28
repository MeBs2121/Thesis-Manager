class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    if user_signed_in?
      @books = current_user.books.all
    else
      redirect_to public_path
    end
  end

  def show
    @vocabulary = @book.vocabularies.build
    @notes = @book.notes.all.includes(:categories)
  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to books_path, notice: "Added Book successfuly"
    end
  end

  def edit

  end

  def update
    if @book.update(book_params)
      flash[:success] = "Profile updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:author, :title, :main, :image)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
