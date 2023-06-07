# ルーディングの設定する場所
# （modelとviewの住所）
Rails.application.routes.draw do
  # HTTPリクエスト
  # どのURLを指定されたときに、どのページを表示するか決めるところ
  # GETはデータの取得をするためのHTTPメソッド（新しいページを取得する場合など）

  #  ↓は「'lists/new' => 'lists#new'」の省略版
  #  ↓
  get 'lists/new'

  get '/top' => 'homes#top'

  # POSTはデータを新規保存するためのHTTPメソッド（投稿する場合など）
  post 'lists' => 'lists#create'

  # index.html.erbで作成したページを表示するためにルーディングを設定
  get 'lists' => 'lists#index'

  # 詳細画面では、どの投稿データを表示するかを判別するために、投稿データのidもURLに含めます。
  # 詳細画面で呼び出される投稿データは、URLの/lists/:id内の:idで判別します。
  # この:idは、アクション内にparams[:id]と記述することで取得できます。
  get 'lists/:id' => 'lists#show' , as: 'list'
  # as: 'list' は'lists#show' の設定の住所に「list」という名前をつけたということ

  get 'lists/:id/edit' => 'lists#edit' , as: 'edit_list'
# patch ＝既存データの更新
  patch 'lists/:id' => 'lists#update' , as: 'update_list'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
