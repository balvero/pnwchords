class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :key, :body

  belongs_to :artist
  accepts_nested_attributes_for :artist

  def self.user_songs(current_user)
    where("user_id = #{current_user}")
  end
end
