Rails.application.routes.draw do
  root :to => "search#index"
  get "search/:q" => "search#find"
  get "search" => "search#find"
end
