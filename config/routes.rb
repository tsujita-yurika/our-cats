Rails.application.routes.draw do

  get 'search', to: 'searches#search'
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
    get 'members/check' => 'members#check'
    patch 'members/withdraw' => 'members#withdraw'
    resources :members
    resources :cats
    resources :requests do
    resources :rooms, :only => [:create, :show]
    end
    resources :messages, :only => [:create]
    resources :rooms, :only => [:show]
    resources :bookmarks, only: [:index, :create, :destroy]
  end

# 管理者ルーティング
  namespace :admin do
    patch 'requests/:id/complete' => 'requests#complete', as: :complete_request
    resources :members, only: [:index, :show, :edit, :update]
    resources :cats, only: [:index, :show, :edit, :update, :destroy]
    resources :requests, only: [:index, :show, :edit, :update, :destroy]
    resources :rooms, only: [:index, :show, :destroy]
    resources :messages, only: [:destroy]
  end

  devise_scope :member do
    post "members/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
