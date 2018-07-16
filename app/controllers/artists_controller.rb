class ArtistsController < ApplicationController


  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    if @artist.save
      redirect_to '/artists'
    else
      render :new # this should save stuff you put in the form from before
    end
  end

  def index
    @artists = Artist.all
  end

  private

    def artist_params
      params.require(:artist).permit(:name) # require = in your params, find key artist
    end
end
