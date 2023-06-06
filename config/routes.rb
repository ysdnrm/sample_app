Rails.application.routes.draw do
  # HTTPリクエスト
  # どのURLを指定されたときに、どのページを表示するか決めるところ
  # GETはデータの取得をするためのHTTPメソッド（新しいページを取得する場合など）

  # 　↓は「'lists/new' => 'lists#new'」の省略版
  get 'lists/new'

  get '/top' => 'homes#top'
  # POSTはデータを新規保存するためのHTTPメソッド（投稿する場合など）
  post 'lists' => 'lists#create'
  # index.html.erbで作成したページを表示するためにルーディングを設定
  get 'lists' => 'lists#index'

  get 'lists/show'

  get 'lists/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
