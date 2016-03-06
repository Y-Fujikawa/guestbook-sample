Rails.application.routes.draw do

  scope "(:locale)" do
    resources :greetings, only: [:index, :create]
    root 'greetings#index'
    devise_for :admin_users, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations', passwords: 'admin/passwords' }
    namespace :admin do
      get '/', :to => 'home#index'
    end
  end
end
