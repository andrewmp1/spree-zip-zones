Rails.application.routes.draw do
  namespace :admin do
    resources :zipcodes
  end
end
