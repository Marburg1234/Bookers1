class BooksController < ApplicationController

  def index #一覧表示画面
    @books = Book.all #複数データを格納するため、@lists複数形にしている
    #表示が必要=viewに記述する=@インスタンスう変数で扱う
    @book = Book.new #new投稿機能を下に表示したいため
  end

  #def new #ユーザへ登録画面を表示
    #@book = Book.new #viewに渡す必要があるため、インスタンス変数で扱う
  #end

  def create #情報の登録処理
    @book = Book.new(book_params) #viewに渡す必要がないため、変数で扱う
    #book.save #保存するメソッド
    #redirect_to book_path(book) #リダイレクトを指定
    #以下フラッシュメッセージを作成する
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all #ここを入力してみた。なぜ@books複数形が必要なのか？@bookじゃだめ？
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id]) #データを1つ取り出してくる
  end

  def update
    @book = Book.find(params[:id])
    #book.update (book_params)
    #redirect_to '/books'
    if @book.update (book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path (@book)
    else
      render :edit
    end
  end

  def show #詳細画面のアクション
    @book = Book.find(params[:id]) #データを1つ取得するため、@list
  end

  def destroy #削除機能を作成する
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to '/books'
    end
  end


  private
  # ストロングパラメーター:Model名とカラムを指定して選別する←脆弱性を防ぐ
  def book_params
    params.require(:book).permit(:title, :body)
    #params.require(:book).permit(:title, :body)
  end

end
