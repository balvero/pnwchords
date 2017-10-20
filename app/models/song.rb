class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  acts_as_taggable

  validates_presence_of :title, :key, :body

  belongs_to :artist
  accepts_nested_attributes_for :artist

  def self.user_songs(current_user)
    where("user_id = #{current_user}")
  end

  def self.search(search)
    joins(:artist).where('songs.title LIKE ? OR artists.name LIKE ?', "%#{search}%", "%#{search}%")
  end

end
