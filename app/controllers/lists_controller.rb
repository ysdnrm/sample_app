class ListsController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    # 投稿フォームのあるページを表示するnewアクション
    @list = List.new
    # この List.new とは送信する用
  end

  # 投稿を保存するためのcreateアクション(生成と同時に保存すること)を作成していく。
  def create

     # １.&2. データを受け取り新規登録するためのインスタンス作成
     # これで新しいModelのインスタンスの作成ができる。
     # この list.new は、フォームから送られてきた内容を保存するために、
     # def list_params
       # params.require(:list).permit(:title, :body)
     # end
     # で指定した内容が揃っているか（あっているか）確認し、データベースへの保存の準備する
     list = List.new(list_params)
    # paramsとはRailsで送られてきた値を受け取るためのメソッド
     # 今回はビューファイルへの受け渡しが必要ではないため、ローカル変数を利用(変数の＠なし)

     # 3. Modelインスタンスデータをデータベースに保存するためのsaveメソッド実行
     # 準備後に、ここでデータベースに実際に保存されます
     list.save

     # 4. トップ画面へリダイレクト
     # (投稿した後に自動でトップ画面に戻るようにすること)
     # 一番最後に記述しているため、処理の最後に詳細画面に遷移します
     redirect_to list_path(list.id)
  end

  # index は一覧画面等のアクションとして定義する（索引という意味）
     # 今回、一覧画面には投稿したList全てを表示させるので、全てのデータを取得する記述
     #.  @インデックス名 = モデル名.メソッドやアクション
  def index
     @lists = List.all
  end

  # 詳細画面表示
  def show
    # 今回はレコードを1件だけ取得するので、インスタンス変数名は単数形の「@list」にします。
    # findメソッドは引数を受け取り、idカラムを引数と比べて保存されているデータを取得してくるメソッドです。(特定した範囲内から条件に当てはまるデータを検索する)
    # (ちなみに、allメソッドはidに関係なく、存在するレコードを全て取得するメソッドでした。)

    # paramsとは保存されているデータから指定した情報を取り出す意味
    @list = List.find(params[:id])
  end

# 更新機能
  # editアクションは、編集するモデルを特定し、編集された内容を受け取り、
  # updateアクションに内容を送信します。
  def edit
    @list = List.find(params[:id])
  end

  # updateアクションは、editアクションから受け取った内容を元にデータベースを書き換えます。
  def update
    list = List.find(params[:id])
    list.update(list_params)
    # showアクションにリダイレクトするために、引数には必ずidが必要
    redirect_to list_path(list.id)
  end

  # privateは一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」という意味がある。(呼び出し制限)
  # そのため、他のアクション（index,show,createなど）を巻き込まないようにprivateはControllerファイルの一番下のendのすぐ上に書くこと。
  private
  # ストロングパラメータ(セキュリティ強化)
  # list_params内では保存したいデータの絞り込み(判定）が行われている
  # 保存できるカラムを限定することによって、マスアサインメント脆弱性を防ぐことができる
  # privateメソッドの名前は、「モデル名_params」とすることが多い
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end