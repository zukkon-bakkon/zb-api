Rails.application.routes.draw do
  namespace :v1 do
    resources :shops
  end
  get "/scrapings" => "scrapings#index"
end
