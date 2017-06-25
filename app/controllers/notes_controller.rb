class NotesController < ApplicationController
  before_action :authenticate_user!

  expose :notes, from: :current_user
  expose :note, scope: -> { notes }

  def index
  end

  def new
  end

  def create
    note.save
    respond_with note, location: root_path
  end

  def destroy
    note.destroy
    respond_with note, location: root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
