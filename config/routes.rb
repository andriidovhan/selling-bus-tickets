Rails.application.routes.draw do

  resources :timetables do
    member do
      get :delete
    end
  end

  resources :users do
    member do
      get :delete
    end
  end
end
