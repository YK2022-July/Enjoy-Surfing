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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #利用者ページ
  get 'end_users/my_page' => 'public/end_users#show', as: 'my_page'
  get 'public/end_users/edit'
  get 'public/end_users/unsubscribe'
  patch 'public/end_users/cancel' => 'public/end_users#cancel', as: 'cancel'


end
