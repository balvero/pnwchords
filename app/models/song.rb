class Song < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :artist
end
