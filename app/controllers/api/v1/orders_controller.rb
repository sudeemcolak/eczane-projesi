
module Api
    module V1
        class OrdersController < ApplicationController
            before_action :current_user, only:[:create, :show]
            #calismadan önce kullanıcının JWTsinden kim olduğunu belirlemeliyiz. bunun icin before action kullandık. create, show ve index actionlarında çalışacak.
            def create
                medicines = params[:medicines] #params istekteki verileri alır.
                #request içerisinde medicines isimli parametreyi getirecek.

                if medicines.nil? || medicines.empty? #eğer medicines boş veya nil ise hata döndür
                    #once nil mi kontrol ediyoruz, sonra boş mu kontrol ediyoruz.
                    return render json: {error: "At least one medication must be listed" }, status: 400 #bad request
                end 

                drugstore_stock = DrugstoreStock.where(medicine: medicines).where("stock > ?", 0)
                #kullanıcının istediği ilaçları stokta olan eczaneleri bulmak için DrugstoreStock modelinde sorgu yapıyoruz. medicines arrayindeki her bir ilacı kontrol ediyoruz ve stock > 0 olanları filtreliyoruz.

                #.plack ve .tally kullanıcam
                number_of_stocks = drugstore_stock.pluck(:drugstore_id).tally
                drugstores_with_all_medicines = number_of_stocks.select{ |drugstore_id, count| count == medicines.length }
                drugstores_with_all_medicines_ids = drugstores_with_all_medicines.keys
                #tally ile her bir drugstore_id'nin kaç kez geçtiğini sayıyoruz. medicines arrayindeki ilaç sayısı ile eşleşenleri seçiyoruz.
                #son olarak bu eczanelerin idlerini alıyoruz.
                user_latitude = current_user.latitude
                user_longitude = current_user.longitude

                nearest_service = NearestDrugstoreService.new(drugstores_with_all_medicines_ids, user_latitude, user_longitude)
                nearest_drugstore = nearest_service.find_nearest_drugstore
               
                #render json: {nearest_drugstore: nearest_drugstore} , status: 200

                order = Order.create(user_id: current_user.id , drugstore_id: nearest_drugstore.id, status: "pending")

                medicines.each do |medicine|
                    OrderItem.create(order_id: order.id, medicine: medicine, status: "pending") 
                end

                render json: {order: order, nearest_drugstore: nearest_drugstore}, status: 201 #created
            end

            def index
                orders = Order.where(user_id: current_user.id).order(created_at: :desc)
                #siparişler yeniden eskiye gelcek
                render json: orders, status: 200 #ok
            end

            def show
                order = Order.find_by(id: params[:id], user_id: current_user.id) #kullanıcının kendi siparişini görmesini sağlamak için user_id ile filtreliyoruz.
                if order.nil?
                    render json: {error: "Order not found"}, status: 404 #not found
                else
                    order_items = order.order_items
                    render json: {order: order, order_items: order_items}, status: 200 #ok
                end
            end
        end
    end
end
