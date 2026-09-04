module Api
  module V1
    class PharmacistOrdersController < ApplicationController
      before_action :current_pharmacist, only: [:index, :show, :update]

      def index
        orders = Order.where(
          drugstore_id: current_pharmacist.drugstore_id
        ).order(created_at: :desc)

        render json: orders, status: 200
      end

      def show
        order = Order.find_by(
          id: params[:id],
          drugstore_id: current_pharmacist.drugstore_id
        )

        if order.nil?
          render json: { error: "Order not found" }, status: 404
        else
          order_items = order.order_items

          render json: {
            order: order,
            order_items: order_items
          }, status: 200
        end
      end

      def update
        order = Order.find_by(
          id: params[:id],
          drugstore_id: current_pharmacist.drugstore_id
        )

        if order.nil?
          return render json: { error: "Order not found" }, status: 404
        end

        old_status = order.status
        status = params[:status]

        status_values = [ #durum adları
          "pending",
          "approved",
          "rejected",
          "preparing",
          "handed_to_courier",
          "out_for_delivery",
          "delivered"
        ]

        status_transactions = { #geçiş izinleri
          "pending"=> ["approved", "rejected"], 
          "approved"=> ["preparing"], 
          "rejected" => [],
          "preparing"=> ["handed_to_courier"], 
          "handed_to_courier"=> ["out_for_delivery"], 
          "out_for_delivery"=> ["delivered"],
          "delivered"=> []
        }

        if !status_values.include?(status)
          return render json: {error: "Invalid Status"}, status: 400
        end

        if status_transactions[old_status].include?(status) #mevcut durumdan yeni gonderilen duruma gecis var mı kontrolü
          #aşağıdaki satırlara devam eder
        else
          return render json: {error: "invalid status entry"}, status: 400

        end

        if old_status == "pending" && status == "approved"

          stock_error = false

          Order.transaction do
            order.order_items.each do |order_item|
              stock = DrugstoreStock.find_by(
                medicine: order_item.medicine,
                drugstore_id: order.drugstore_id
              )

              if stock.nil? || stock.stock <= 0
                # return render json: {error: "This product is out of stock"}, status: 422
                
                stock_error = true
                raise ActiveRecord::Rollback
                
              else
                stock.stock -= 1
                stock.save
              end
            end

            order.update(status: status)
          end

          if stock_error
            return render json: { error: "This product is out of stock" }, status: 422
          end

        else
          order.update(status: status)
        end

        render json: { order: order, order_items: order.order_items}, status: 200
      end
    end
  end
end