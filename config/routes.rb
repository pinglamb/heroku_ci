HerokuCi::Engine.routes.draw do
  scope :module => :heroku_ci do
    resources :projects
    root :to => "projects#index"
  end
  devise_for :users
end
