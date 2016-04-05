Rails.application.routes.draw do

  namespace :admin do
  get 'greetings/index'
  end

  scope "(:locale)" do
    resources :greetings, only: [:index, :create]
    root 'greetings#index'
    namespace :admin do
      devise_for :admin_users, controllers: { sessions: 'admin/devise/sessions', registrations: 'admin/devise/registrations', passwords: 'admin/devise/passwords' }
      get '/', :to => 'home#index'
      resources :greetings
    end
  end
end
