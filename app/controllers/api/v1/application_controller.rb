class Api::V1::ApplicationController < ApplicationController
    def show
        current_user
        render json: {status: :ok}
    end
end