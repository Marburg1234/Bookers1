Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'top' => 'homes#top' #分からないためとりあえずtop画面にurl /topと設定している
  resources :books
  
  root to: 'homes#top'

#resources :booksにて作成されるルーティング一覧
  # prefix    Verb    URI Pattern     =>  Controller#Action   機能

  # books     get     'books'         => 'books#index'      一覧画面の表示
  # books     post    'books'         => 'books#create'     投稿機能
  # new_book  get     'books/new'     => 'books#new         登録画面の表示
  # edit_book get     'books/:id/edit => 'books#edit'       編集画面の表示
  # book      get     'books/:id      => 'books#show'       詳細画面の表示
  # book      patch   'books/:id      => 'books#update'     更新機能
  # book      put     'books/:id      => 'books#update'     更新機能
  # book      delete  'books/:id'     => 'books#destroy'    削除機能

end
