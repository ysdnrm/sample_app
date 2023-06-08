# ルーディングの設定する場所
# （modelとviewの住所）
Rails.application.routes.draw do
  # HTTPリクエスト
  # どのURLを指定されたときに、どのページを表示するか決めるところ
  # GETはデータの取得をするためのHTTPメソッド（新しいページを取得する場合など）

 
  get '/top' => 'homes#top'
  
# resourcesメソッドは、ルーティングを一括して自動生成してくれる機能
 resources :lists
# コマンド 「rails routes」で生成されたルーディングの確認できる
# HTTPメソッドの前に書いてあるのが、パス
# 間が空いて右に書かれているのが、アクション

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
