Rails.application.routes.draw do

  namespace :admin do
    get 'greetings/index'
  end

  scope "(:locale)" do
    resources :greetings, only: [:index, :create]
    root 'greetings#index'
    namespace :admin do
      get '/', :to => 'home#index'
      resources :greetings do
        get 'enable'
      end
    end
    devise_for :admin_users, path: :admin, controllers: { sessions: 'admin/devise/sessions', registrations: 'admin/devise/registrations', passwords: 'admin/devise/passwords' }
  end
end
