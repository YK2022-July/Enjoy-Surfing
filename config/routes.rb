Rails.application.routes.draw do
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about', as: 'about'

  #管理者用
  #URL /admin/sign_in …
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #利用者用
  #URL /end_users/sign_in …
  devise_for :end_users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  #ゲストログイン用
  devise_scope :end_user do
    post '/end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #利用者ページ
  get 'end_users/my_page/:id' => 'public/end_users#show', as: 'my_page'
  get 'end_users/:id/edit' => 'public/end_users#edit', as: 'end_user_edit'
  patch 'end_users/:id' => 'public/end_users#update', as: 'end_user_update'
  #resources :end_users, only: [:edit]

  #利用者退会用
  get 'end_users/:id/unsubscribe' => 'public/end_users#unsubscribe', as: 'unsubscribe'
  get 'end_users/after_cancel' => 'public/end_users#after_cancel', as: 'after_cancel'
  patch 'end_users/:id/cancel' => 'public/end_users#cancel', as: 'cancel'
end
