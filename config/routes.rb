Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users
  root to: 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stock', to: 'stocks#search', defaults: { format: 'js' }
  get 'friends_list', to: 'users#my_friends_list'
  get 'search_friend', to: 'users#search', defaults: { format: 'js' }
end
