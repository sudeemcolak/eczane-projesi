#barcode : barkod bilgisini fastapi'ye gonderme
#verify : receteyi dogrulama
#approve : receteyi onaylama // bu kısım panel-eczacı tarafında alınacak
require "net/http"
module Api
    module V1
        class PrescriptionsController < ApplicationController
            def barcode
                barkod_no = params[:barkod_no]

                url = "http://127.0.0.1:8000/recete/barkod"
                url = URI.parse(url)
                req = Net::HTTP::Post.new(url)
                req.set_form_data("barkod_no" => barkod_no)
                
                http = Net::HTTP.new(url.host, url.port)
                res = http.request(req)

                data = JSON.parse(res.body) #apiden gelen json yazisini ruby yapisina cevirdi

                render json: data
            end
        end

    end
end