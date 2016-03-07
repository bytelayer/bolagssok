Rails.application.routes.draw do
  root :to => "search#index"
  get "search/:q" => "search#index"
  get "search" => "search#index"
end
