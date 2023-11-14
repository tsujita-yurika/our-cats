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


# 会員用
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :members
    resources :cats
    resources :requests
    resources :messages, :only => [:create]
    resources :rooms, :only => [:create, :show]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
