class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @entries = Entry.where(user_id: current_user.id)
  end

  def new
    @entry = Entry.new
  end

  def create
    logger.debug "Received params: #{params.inspect}"
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
    params.require(:entry).permit(:title, :description, :occurred_on, :uploaded_image)
  end
end