class List < ApplicationRecord
  # ActiveStorage(画像の投稿、表示するためのもの)
  has_one_attached :image

  # バリデーションの実装(フォームの未入力のチェックを行い、エラーメッセージを表示)
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  # validatesで対象とする項目を指定、入力されたデータのpresence（存在）をチェック。
  # trueと記述すると、データが存在しなければならないという設定
end
