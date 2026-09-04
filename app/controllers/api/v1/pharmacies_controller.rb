module Api
    module V1
        class PharmaciesController < ApplicationController
            #kullanıcının konumuna göre en yakın eczaneleri getirme
            before_action :current_user

            def nearby
                latitude = @current_user.latitude
                longitude = @current_user.longitude
                 
                query = URI.encode_www_form ([[ 'lat' , "#{latitude}" ], [ 'lng' , "#{longitude}" ], [ 'limit' , 10]])

                url = "https://eczaneadresi.com/api/public/v1/nearest-pharmacies/" + "?" + query
                url = URI.parse(url)
                 req = Net::HTTP::Get.new(url.to_s)
                req["User-Agent"] = "EczaneApp/1.0"
                http = Net::HTTP.new(url.host, url.port)
                http.use_ssl = true
                res = http.request(req)

                data = JSON.parse(res.body) #apiden gelen json yazisini ruby yapisina cevirdi

                render json: data
            end
        end
    end
end


