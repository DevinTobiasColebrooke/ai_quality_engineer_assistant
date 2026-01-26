Rails.application.routes.draw do
  root "sessions#index"

  resources :sessions, only: [ :index, :show, :new, :create, :destroy ] do
    member do
      post :run_test
    end
  end

  # resources :test_sessions do
  #   member do
  #     get :download_config # To download the opencode.json/playwright config
  #   end
  # end

  get "up" => "rails/health#show", as: :rails_health_check
end
