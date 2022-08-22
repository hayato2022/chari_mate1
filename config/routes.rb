Rails.application.routes.draw do


# ユーザー側
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

# ログアウトの際method の delete が get になってしまうので以下を追記
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end


  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
  end





  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
