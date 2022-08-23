class Post < ApplicationRecord
  has_one_attached :image
  # has_one_attached :video
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
end
