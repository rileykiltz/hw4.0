class EntriesController < ApplicationController
  def index
    @entries = Entry.where(user_id: current_user.id)
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user_id = current_user.id
    if @entry.save
      redirect_to entries_path
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on)
  end
end