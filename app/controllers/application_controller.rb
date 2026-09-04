#ortak altyapi


#current_user mantigi tum controllerda kisayoldan kullanabilecegimiz sekilde oldugundan.
#gelen istegin JWTsinden kullanicinin kim oldugunu bulur

class ApplicationController < ActionController::API
    def current_user
        value = request.headers["Authorization"] #su anda bu metot gelen istegin tum Authorization header bilgilerini donuyor.
        # request.headers diyince bearer eyJ... kismini cekmis olduk.

        if value.nil? #header yoksa hata donduruyoz
            return  render json: "unauthorized", status: :unauthorized
            #else gerek yok, sonraki satirdan devam edecek (?)
        end

        jwt = value.split[1]

        decoded_token = JsonWebToken.decode(jwt) #jwtyi cozuyoruz

        if decoded_token == nil
            return render json: "unauthorized", status: :unauthorized
        end

        id = decoded_token["user_id"]
        #id = decoded_token["user_id"] #decoded_token hash seklinde old icin value cekiyoruz


        @current_user= User.find(id)
        #render json: User.find(id), except: :password_digest #IDye ait User nesnesini dondur
        #value to be rendered.
        
    end

    def current_pharmacist
        value = request.headers["Authorization"]
        if value.nil?
            return nil
        end

        jwt = value.split[1]
        decoded_token = JsonWebToken.decode(jwt)

        if decoded_token == nil
            return nil
        end

        id = decoded_token["pharmacist_id"]
        @current_pharmacist = Pharmacist.find(id)
    end
end
