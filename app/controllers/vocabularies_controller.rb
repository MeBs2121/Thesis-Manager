class VocabulariesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_book, only: [:index, :show, :new, :create, :edit, :update]
  before_action :find_vocabulary, only: [:edit, :update, :destroy]

  def index
    @vocabularies = Vocabulary.all
    @vocabulary = Vocabulary.new
  end

  def show

  end

  def new
    @vocabulary = @book.vocabularies.build
  end

  def create
    @vocabulary = @book.vocabularies.build(vocabulary_params)

    if @vocabulary.save
      redirect_to book_vocabularies_path(@vocabulary.book, @vocabulary), notice: "added vocabulary successfuly"
    end

  end

  def edit

  end

  def update
    if @vocabulary.update(vocabulary_params)
      redirect_to book_vocabularies_path(@vocabulary.book, @vocabulary), notice: "vocabulary updated"
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
