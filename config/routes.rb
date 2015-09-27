Rails.application.routes.draw do
  devise_for :admin_users
  
  scope "(:locale)" do
    resources :greetings, only: [:index, :create]
    root 'greetings#index'
    namespace :admin do
      get '/', :to => 'home#index'
    end
  end
end
