Redditclonetdd::Application.routes.draw do
  resources :users
  resource :session, :only => [:new, :create, :destroy]
  resources :links do
    resources :comments
  end
  resources :subs

end
