class TracksController < ApplicationController
    def index
        @album = Album.find(params[:album_id])
        @tracks = @album.tracks
        render :index
    end

    def show
        @album = Album.find(params[:album_id])
        @track = @album.tracks.find(params[:id])
        render :show
    end

    def new
        @album = Album.find(params[:album_id])
        @track = Track.new
        render :new
    end

    def create
        @album = Album.find(params[:album_id])
        @track = @album.tracks.build(params.require(:track).permit(:title, :length))
        if @track.save
          flash[:success] = "Track saved successfully"
          redirect_to album_tracks_url(@album)
        else
          flash.now[:error] = "Track could not be saved"
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @album = Album.find(params[:album_id])
        @track = @album.tracks.find(params[:id])
        render :edit
    end

    def update
        @album = Album.find(params[:album_id])
        @track = @album.tracks.find(params[:id])
        if @track.update(params.require(:track).permit(:title, :length))
          flash[:success] = "track updated successfully"
          redirect_to album_track_url(@album, @track)
        else
          flash.now[:error] = "Track could not be updated"
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @album = Album.find(params[:album_id])
        @track = @album.tracks.find(params[:id])
        @track.destroy
        flash[:success] = "Track deleted successfully"
        redirect_to album_tracks_url(@album), status: :see_other
      end
end
