Rails.application.routes.draw do

   scope module: :public do
     resource :customers, only: [:show, :edit, :update]
     resources :addresses, only: [:index, :create, :edit, :update, :destroy]
     resources :items, only: [:index, :show]
     
     resources :cart_items, only: [:index, :update, :destroy, :create] do
         collection do
             delete :destroy_all
         end
     end

     resources :orders, only: [:new, :create, :index, :show] do
        collection do
          post :confirm
          get :complete
        end
     end
     


   end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
}

 scope module: :public do
   root to: "homes#top"
   get "about" => "homes#about"

   get "customer/secession" => "customers#secession"
   patch "customer/change" => "customers#change"



 end


  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
