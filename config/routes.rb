Rails.application.routes.draw do
  resources :bags, constraints: lambda { |req| req.format == :json } do
    resources :things, constraints: lambda { |req| req.format == :json }
  end
end
