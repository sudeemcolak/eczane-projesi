module Api
    module V1
        class SessionsController < ApplicationController

            before_action :current_user, only:[:destroy]

            def create
                # SessionsController icindeki create actionunu calistirir.
                # bu yuzden ismi "#"dan sonra gelen isimle ayni olmalidir
                #login islemi

                #login olurken henuz token yok, o yuzden before_action calisamaz

                @user = User.find_by(email: params[:user] [:email]) #maile sahip kullaniciyi aradim
                if @user && @user.authenticate(params[:user][:password]) #kullanici varsa ve sifre de dogruysa
                    token =JsonWebToken.encode(user_id: @user.id)
                    # session[:user_id] = @user.id
                    # session, kullaniciyi sunucu tarafinda hatirlamasini saglayan mekanizmaydi
                    #JWT gelince session kalkti
                    render json: {token: token, logged_in: true, user: @user},  status: :ok, except: :password_digest #200 kodu, OK
                else
                    render json: "Invalid Email OR Password", status: :unauthorized #401 kodu, yetkisizi erisim.
                end

                #JWT TOKEN OLUSTURMAM GEREKIYOR

            end

            def destroy
                #token blackliste alinir
                #logout islemi
                render json: {message: "The session has been successfully closed"}
            end

        end
    end
end