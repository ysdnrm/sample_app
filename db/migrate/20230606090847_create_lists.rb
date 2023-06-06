class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      # カラムを定義
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
