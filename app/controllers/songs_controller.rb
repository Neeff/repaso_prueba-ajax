class SongsController < ApplicationController
        before_action :set_song, only: %i[show update edit destroy]
  def index
    @songs = Song.all
    @song = Song.new
  end
  def create
        @song = Song.new(song_params)
        if @song.save 
                respond_to :js
        else
                format.html { render :new }
                format.json { render json: @song.errors, status: :unprocessable_entity }
              end
  end
  def show 
        respond_to :js
  end
  def edit
      respond_to :js
  end 

  def  update
    @song.update(song_params)
    if @song.save
      respond_to :js
    else
      redirect_to root_path, alert: 'Error al actualizar'
    end
  end

  def destroy
      @song.delete
      respond_to :js
  end

  def search
      parameters = params[:search]
      if parameters.blank?
            @songs = Song.all
            respond_to :js
      elsif parameters.nil?
            @songs = Song.all
      else
            @songs = Song.where('title LIKE ?',"%#{parameters}%")
            respond_to :js
      end
  end


  private
  def song_params
        params.require(:song).permit(:title, :artist, :year)
  end 

  def set_song
        @song = Song.find(params[:id])
  end 
end
