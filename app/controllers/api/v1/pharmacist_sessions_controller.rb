module Api
    module V1
        class PharmacistSessionsController < ApplicationController

            before_action :current_pharmacist, only:[:destroy]

            def create
                #login islemi
                @pharmacist = Pharmacist.find_by(email: params[:pharmacist][:email]) #eczaciyi mail ile buluyoruz
                if @pharmacist && @pharmacist.authenticate(params[:pharmacist][:password]) #kullanici varsa ve sifre de dogruysa
                    #authenticate metodu, has_secure_password ile birlikte gelir ve sifreyi dogrular.
                    token =JsonWebToken.encode(pharmacist_id: @pharmacist.id)
                    render json: {token: token, logged_in: true, pharmacist: @pharmacist},  status: :ok, except: :password_digest #200 kodu, OK
                else
                    render json: "Invalid Email OR Password", status: :unauthorized #401 kodu, yetkisiz erisim.
                end

            end

            def destroy
                #logout islemi
                render json: {message: "The session has been successfully closed"}
            end

        end
    end
end