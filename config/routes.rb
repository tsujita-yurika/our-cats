Rails.application.routes.draw do

  get 'rooms/show'
# 会員用
# URL /customers/sign_in ...
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


# 会員ルーティング
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :members
    resources :cats
    resources :requests do
      resources :rooms, :only => [:create]
    end
    resources :messages, :only => [:create]
    resources :rooms, :only => [:show]
  end

# 管理者ルーティング
  namespace :admin do
  resources :members, only: [:index, :show, :edit, :update]
  resources :cats, only: [:index, :show]
  resources :requests, only: [:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
