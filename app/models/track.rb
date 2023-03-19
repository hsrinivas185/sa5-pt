# == Schema Information
#
# Table name: tracks
#
#  id         :bigint           not null, primary key
#  length     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :bigint
#
# Indexes
#
#  index_tracks_on_album_id  (album_id)
#
# Foreign Keys
#
#  fk_rails_...  (album_id => albums.id)
#
class Track < ApplicationRecord
  belongs_to(
    :album,
    class_name: 'Album',
    foreign_key: 'album_id',
    inverse_of: :tracks
  )
  
  validates :title, presence: true
  validates :length, numericality: { greater_than: 0 }
end
