Rails.application.routes.draw do
  # 金句
  resources :dialogues, only: %i[index show]
  # 帳號管理
  devise_for :users
  # 首頁
  root to: 'pages#index'
  # 後台
  namespace :backstage do
    root to: 'dialogues#index'
    get 'pages/index'
    resources :dialogues
  end

  # api
  namespace :api do
    post 'line/callback'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
