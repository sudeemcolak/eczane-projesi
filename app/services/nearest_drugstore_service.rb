include Math
Radius = 6372.8 #km
#haversine formulu ile en yakın eczaneyi cekicez.

class NearestDrugstoreService
    #classa dışardan bilgi verdik
    def initialize(drugstores_with_all_medicines_ids, user_latitude, user_longitude)
        @drugstores_with_all_medicines_ids = drugstores_with_all_medicines_ids
        @user_latitude = user_latitude
        @user_longitude = user_longitude
    end

    def deg2rad(lat, long)
        [lat * PI / 180, long * PI / 180]
    end

    def spherical_distance(start_coords, end_coords)
        lat1, long1 = deg2rad *start_coords
        lat2, long2 = deg2rad *end_coords
        2 * Radius * asin(sqrt(sin((lat2-lat1)/2)**2 + cos(lat1) * cos(lat2) * sin((long2 - long1)/2)**2))
    end
        
    def find_nearest_drugstore()

        drugstores = Drugstore.where(id: @drugstores_with_all_medicines_ids)

        drugstores.min_by{|drugstore| spherical_distance([@user_latitude, @user_longitude], [drugstore.latitude, drugstore.longitude])}
    end

end
