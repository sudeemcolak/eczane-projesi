module Api
    module V1
        class UsersController < ApplicationController

            before_action :current_user, only:[:show, :update]
            #create icin calismayacak cunku kayit olurken token yok henuz, hata olur

            def create
                #kullanici olusturma 
                @user = User.new(user_params)
                location = "#{@user.city}" + ", " +  "#{@user.district}" + ", " + "#{@user.neighborhood}"
                coordinates = GeocodingService.call(location)

                if coordinates.nil?
                    render json: "The location of the address could not be found", status: 422
                else
                    @user.latitude = coordinates[:latitude]
                    @user.longitude = coordinates[:longitude] 

                    if @user.save
                        render json: @user, status: :created #status : HTTP durum kodudur. 201 created 422 unprocessable entity 
                    else
                        render json: @user.errors, status: :unprocessable_entity
                    end
                end

            end


            def show
                #kullanici goster
                render json: @current_user, except: :password_digest
               
            end

            def update
                #kullanici guncelle
                # @user = User.find(params[:id]) #kimi guncelledigimi buluyo

                if user_params.has_key?(:city) || user_params.has_key?(:district) || user_params.has_key?(:neighborhood) 

                    #eger yeni deger vrsa guncelliyoruz yoksa eski degeri aliyoruz
                    district = user_params[:district] || @current_user.district
                    city = user_params[:city] || @current_user.city
                    neighborhood = user_params[:neighborhood] || @current_user.neighborhood


                    location = "#{city}" + ", " +  "#{district}" + ", " + "#{neighborhood}"
                    coordinates = GeocodingService.call(location)


                    if coordinates.nil?
                        render json: "We were unable to access the coordinates for the address you entered. Please enter a more specific address", status: 422
                        
                    else
                        new_params = user_params.merge(latitude: coordinates[:latitude], longitude: coordinates[:longitude])
                    
                        if @current_user.update(new_params) #neyi guncelleyecegini aliyor
                            render json: @current_user, except: :password_digest
                        else    
                            render json: @current_user.errors, status: :unprocessable_entity 
                        end

                    end
                else
                    if @current_user.update(user_params) #neyi guncelleyecegini aliyor
                        render json: @current_user, except: :password_digest
                    else    
                        render json: @current_user.errors, status: :unprocessable_entity 
                    end    
                end
            end
                                                            
            private

            #expect, parametrelerin tek adımda güvenli bir şekilde izin verilmesini ve zorunlu kılınmasını sağlar
            def user_params
                #kullanicinin flutterdan gelen parametrelerini aliyor ve izin veriyor
                params.expect(user: [:name, :surname, :tc_no, :phone_no, :address, :email, :password, :city, :district, :neighborhood])
            end
            
        end
    end
end