class Api::V1::SessionsController < Api::V1::BaseController
    def create
        @user = User.where(email: params[:user][:email])
        
        if @user&.valid_password?(params[:user][:password])
            render json: @user, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end