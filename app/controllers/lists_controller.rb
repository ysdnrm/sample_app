class ListsController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    # 投稿フォームのあるページを表示するnewアクション
    @list = List.new
  end

  # ↑とは別に、投稿を保存するためのcreateアクションを作成していく。
  def create

     # １.&2. データを受け取り新規登録するためのインスタンス作成
     # これで新しいModelのインスタンスの作成ができる。
     list = List.new(list_params)
     # 今回はビューファイルへの受け渡しが必要ではないため、ローカル変数を利用(変数の＠なし)

     # 3. Modelインスタンスデータをデータベースに保存するためのsaveメソッド実行
     # ここでデータベースに実際に保存されます
     list.save

     # 4. トップ画面へリダイレクト
     # (投稿した後に自動でトップ画面に戻るようにすること)
     # 一番最後に記述しているため、処理の最後にトップ画面に遷移します
     redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  # privateは一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」という意味がある。(呼び出し制限)
  # そのため、他のアクション（index,show,createなど）を巻き込まないようにprivateはControllerファイルの一番下のendのすぐ上に書くこと。
  private
  # ストロングパラメータ(セキュリティ強化)
  # list_params内では保存したいデータの絞り込みが行われている
  # 保存できるカラムを限定することによって、マスアサインメント脆弱性を防ぐことができる
  # privateメソッドの名前は、「モデル名_params」とすることが多い
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
