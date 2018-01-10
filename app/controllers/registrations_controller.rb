class RegistrationsController < Devise::RegistrationsController
    private
        def sign_up_params
         params.require(:user).permit(:email, :password, :password_confirmation, :profile_attributes => [:name, :birth, :phone, :address, :postal_code])
        end
    
end