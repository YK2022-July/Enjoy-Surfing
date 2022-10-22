Rails.application.routes.draw do

  namespace :admin do
    get 'training_post_comments/erase'
  end
  #Top/Aboutページ
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
  get 'end_users/:id/my_page' => 'public/end_users#show', as: 'my_page'
  get 'end_users/:id/edit' => 'public/end_users#edit', as: 'end_user_edit'
  patch 'end_users/:id' => 'public/end_users#update', as: 'end_user_update'
  #resources :end_users, only: [:edit]

  #利用者退会用
  get 'end_users/:id/unsubscribe' => 'public/end_users#unsubscribe', as: 'unsubscribe'
  get 'end_users/after_cancel' => 'public/end_users#after_cancel', as: 'after_cancel'
  patch 'end_users/:id/cancel' => 'public/end_users#cancel', as: 'cancel'

  #トレーニング記録機能用
  get 'training_posts/new' => 'public/training_posts#new', as: 'training_posts_new'
  post 'training_posts' => 'public/training_posts#create'
  get 'training_posts/index' => 'public/training_posts#index', as: 'training_posts_index'
  get 'training_posts/:id/my_posts' => 'public/training_posts#my_posts', as: 'training_posts_my_posts'
  #get 'training_posts/:id/show' => 'public/training_posts#show', as: 'training_posts_show'
  scope module: :public do
    resources :training_posts, only: [:show] do
      resource  :fights, only: [:create, :destroy]
      resources :training_post_comments, only: [:create, :destroy]
    end
  end
  get 'training_posts/:id/edit' => 'public/training_posts#edit', as: 'training_posts_edit'
  patch 'training_posts/:id' => 'public/training_posts#update', as: 'training_posts_update'
  delete 'training_posts/:id' => 'public/training_posts#destroy', as: 'training_posts_destroy'

  #post 'training_posts/:training_post_id/show/fights/:id' => 'public/fights#create', as: 'training_posts_fight'
  #delete 'training_posts/:training_post_id/show/fights/' => 'public/fights#destroy'

  #目標設定機能用
  scope module: :public do
  resources :goals
  end

  #キーワード検索用
  get 'search' => 'public/searches#search'

  #管理者Topページ
  namespace :admin do
    get '' => 'homes#top',as:'top'
    #get 'administrate' => 'training_post_comments#administrate'
    #get '/:id/erase' => 'training_post_comments#erase', as: 'erase'
    resources :training_post_comments, only: [:index, :show, :destroy] do
    end
    resources :end_users, only: [:index, :edit, :update, :destroy] do
    end
  end

  #管理者用
  #scope module: :admin do
    #resources :end_users, only: [:index, :edit, :update, :destroy] do
    #end
  #end

end
