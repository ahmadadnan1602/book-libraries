Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :libraries, only: [] do
      resources :books, module: :libraries, only: [:index]
    end
  end

  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
end
