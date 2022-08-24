Rails.application.routes.draw do
  namespace :public do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
    get 'users/show'
    get 'users/edit'
  end


# ユーザー側
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# ログアウトの際method の delete が get になってしまうので以下を追記
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    # ゲストログイン
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :posts
    resources :users, only: [:show, :edit, :update]

    #タグによって絞り込んだ投稿を表示するアクションへのルーティング
    resources :tags do
      get 'posts', to: 'posts#search'
    end
  end





  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
