class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :key, :body

  belongs_to :artist
end
