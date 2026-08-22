Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # GET /api/v1/



  ########

  # POST register #kayit olma
  # POST login #giris yapma
  # POST logout #cikis yapma
  # POST forgot_password #sifre unuttum
  # POST reset_password #sifre yenileme
  # GET profile #profil goruntuleme
  # PATCH profile #profil guncelleme

  #########


  namespace :api do
    
    namespace :v1 do

      #USERS
      post "/register" , to: "users#create" #  controller#action


      # BUNLAR DOGRU ROUTELAR; CALISIR AMA DAHA TEMIZ BI ROUTE OLUSTURMAK ISTIYORUZ.
      # get "/profile" , to: "users#show"
      # patch "/profile" , to: "users#update"
      resources :users, only: [:show, :update]



      #SESSIONS
      post "/login" , to: "sessions#create" #oturum olusturmak.
      delete "/logout" , to: "sessions#destroy" #oturum kapama
      
      #PHARMACIES
      get "/nearby" , to: "pharmacies#nearby"



      #ORDER_CONTROLLERS

      #PRESCRIPTIONS // RECETE 

    end


    #namespace :v2 do

    #end
  end




  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
