class List < ApplicationRecord
  # ActiveStorage(画像の投稿、表示するためのもの)
  has_one_attached :image
end
