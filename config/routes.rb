Pamer::Engine.routes.draw do
  resources :packages do
    resources :items do
    end
    resources :items_packages do
    end
  end

  resources :orders
end
