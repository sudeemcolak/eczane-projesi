#koordinat olusturma servisi (lon-lat)
require 'net/http'
class GeocodingService
    def GeocodingService.call(location) #class methodu

        location = location.titleize #mevcut konum bilgisini titleize yapar (ilk harf buyuk)
        #adres metnini alir, nomimatim'e gonderir, sonuc yoksa nil varsa lat/lng degerleri doner
            query = URI.encode_www_form ([[ 'q' , location ], [ 'format' , "json" ], [ 'limit' , 1], ['addressdetails', 1]])
            #addressdetails = 1 yapinca adres parcalara ayrilabildi
            url = 'https://nominatim.openstreetmap.org/search' + "?" + query
            url = URI.parse(url)

            req = Net::HTTP::Get.new(url.to_s)
            req["User-Agent"] = "EczaneApp/1.0"
            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            res = http.request(req)

            data = JSON.parse(res.body) #apiden gelen json yazisini ruby yapisina cevirdi
            
            if data.empty?
                nil
            else
                latitude = data[0]["lat"] 
                longitude = data[0]["lon"]

                { latitude: latitude, longitude: longitude } #HASH
            end
        end
        
end