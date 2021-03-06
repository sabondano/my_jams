class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    if song_params[:title].blank?
      flash[:alert] = "Song was not saved. It needs a title!"
      redirect_to new_song_path
    else
      Song.create(song_params)
      session[:most_recent_song_title] = song_params[:title]
      flash[:notice] = "The song titled #{song_params[:title]} was created!"
      redirect_to songs_path
    end
  end

  def edit
  end
  
  def update
    @song.update(song_params)
    redirect_to @song
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

  def set_song
    @song = Song.find(params[:id])
  end
end
