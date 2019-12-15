Rails.application.routes.draw do
  namespace :v1 do
    resources :shops, only: [:index]
    resources :girls, only: [:index]
  end
  get "/scrapings" => "scrapings#index"
end
