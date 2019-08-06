Rails.application.routes.draw do

  root to: 'surveys#index'

  get '/take_survey/:survey_id/' =>'surveys#take', :as => :take_survey
  post '/take_survey/:survey_id/' =>'surveys#submit', :as => :submit_survey

  resources :surveys do
    resources :questions do
      resources :answers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
