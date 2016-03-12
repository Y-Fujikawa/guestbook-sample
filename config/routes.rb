Rails.application.routes.draw do

  scope "(:locale)" do
    resources :greetings, only: [:index, :create]
    root 'greetings#index'
    devise_for :admin_users, controllers: { sessions: 'admin/devise/sessions', registrations: 'admin/devise/registrations', passwords: 'admin/devise/passwords' }
    namespace :admin do
      get '/', :to => 'home#index'
    end
  end
end
