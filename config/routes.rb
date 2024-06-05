# config/routes.rb
Rails.application.routes.draw do
  resources :show_reels do
    resources :clips
  end
end
