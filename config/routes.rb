Rails.application.routes.draw do
  # HTTPリクエスト
  # GETはデータの取得をするためのHTTPメソッド（新しいページを取得する場合など）
  get 'lists/new'
  # POSTはデータを新規保存するためのHTTPメソッド（投稿する場合など）
  post 'lists' => 'lists#create'
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
