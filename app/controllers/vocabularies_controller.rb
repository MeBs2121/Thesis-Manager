class VocabulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_book, only: [:show, :new, :create, :edit, :update]
  before_action :find_vocabulary, only: [:edit, :destroy]

  def index
    @vocabularies = Vocabulary.all
  end

  def show

  end

  def new
    @vocabulary = @book.vocabularies.build
  end

  def create
    @vocabulary = @book.vocabularies.build(vocabulary_params)

    if @vocabulary.save
      flash[:success] = "added vocabulary successfly"
      redirect_to root_path
    end

  end

  def edit

  end

  def update
    if @vocabulary.update(vocabulary_params)
      flash[:success] = "Vocabulary updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @vocabulary.destroy
    redirect_to book_vocabularies_path
  end

  private

    def vocabulary_params
      params.require(:vocabulary).permit(:word, :meaning)
    end

    def find_book
      @book = Book.find(params[:book_id])
    end

    def find_vocabulary
      @vocabulary = Vocabulary.find(params[:id])
    end
end
