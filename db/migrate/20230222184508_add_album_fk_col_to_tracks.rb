class AddAlbumFkColToTracks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tracks, :album, foreign_key: true
  end
end
