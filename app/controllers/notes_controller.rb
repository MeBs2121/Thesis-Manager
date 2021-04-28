class NotesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :find_note, only: [:show, :edit, :update, :destroy]
  before_action :find_book

  def index
      @notes = @book.notes.all
  end

  def show

  end

  def new
    @note = @book.notes.build
  end

  def create
    @note = @book.notes.build(note_params)

    if @note.save
      redirect_to @book
    end
  end

  def edit

  end

  def update
    if @note.update(note_params)
      flash[:success] = "Note updated"
      redirect_to @note
    else
      render 'edit'
    end
  end

  def destroy
    @note.destroy
    flash[:success] = "Note deleted successfly"
    redirect_to book_notes_path
  end

  private

    def note_params
      params.require(:note).permit(:body, :title, :page, category_ids: [] )
    end

    def find_note
      @note = Note.find(params[:id])
    end
    def find_book
      @book = Book.find(params[:book_id])
    end
end
