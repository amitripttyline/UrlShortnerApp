# config/routes.rb
Rails.application.routes.draw do
  post '/shorten', to: 'short_urls#create'
  get '/:short_code', to: 'short_urls#show'
end
