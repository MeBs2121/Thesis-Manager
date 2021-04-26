class VocabulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_book

  def index
    @vocabularies = Vocabulary.all
  end

  def show

  end

  def new
    @book = current_user.books.build
  end

  def create
    @book = current_user.books.build(book_params)

    if @book.save
      redirect_to books_path
    else
      render 'new'
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
  end

  private

    def vocabulary_params
      params.require(:vocabulary).permit(:word, :meaning)
    end

    def find_book
      @book = Book.find(params[:book_id])
    end
end
