class ListsController < ApplicationController

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    # 投稿フォームのあるページを表示するnewアクション
    @list = List.new
    # この List.new とは送信する用
  end

  # 投稿を保存するためのcreateアクション(生成と同時に保存すること)を作成していく。
  def create
    # １. データを受け取り新規登録するためのインスタンス作成
     list = List.new(list_params)
      # 2. データをデータベースに保存するためのsaveメソッド実行
     list.save
     # 3. フラッシュメッセージを定義し、詳細画面へリダイレクト
      flash[:notice] = "投稿が成功しました"
      redirect_to list_path(list.id)
      # render :new
      #  render :アクション名で、同じコントローラ内の別アクションのViewを表示できます
      # renderするビューに必要なインスタンス変数は、
      # createアクション内にあらかじめ用意しなくてはならない
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

  # 削除機能のアクション(テーブルからデータが削除させる)
  # viewを表示しないため、＠いらない
  def destroy
    list = List.find(params[:id]) #データ（レコード）を１件取得
    list.destroy #削除
    redirect_to '/lists' #一覧画面へリダイレクト
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