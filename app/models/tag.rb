class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持ち、それはpost_tagsを通じて参照できる
  has_many :posts, through: :post_tags
  
  validates :name, uniqueness: true, presence: true
end
