# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  artist     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  has_many(
    :tracks,
    class_name: 'Track',
    foreign_key: 'album_id',
    inverse_of: :album,
    dependent: :destroy
  )
  validates :title, presence: true
  validates :artist, presence: true
end
