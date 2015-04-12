Codeandbeers::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, :controllers => {:registrations => "users", :omniauth_callbacks => "callbacks" }

  devise_scope :user do
    get 'users/:id' => 'users#show', as: "user"
  end
  resources :users do 
    resources :helpful_links  
  end
  
  root 'statics#home'
  
  resources :statics
  resources :events


  #Match Routes
  match '/about' => 'statics#about', via: 'get', as: 'about'
  match '/contact' => 'statics#contact', via: 'get', as: 'contact'
  match '/dashboard' => 'statics#dashboard', via: 'get', as: 'dashboard'

end
