Rails.application.routes.draw do

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check


  namespace :api do

    resources :images

    resources :annotations


    resources :tasks do

      get "next_image", on: :member

    end

  end


end