module ProductsHelper
    #Rendering like or unlike button
    def choose_fav_button(product)
        if user_signed_in?
            if current_user.favorite?(product)
                render '/favorites/unfav_button', product: product
            else
                render '/favorites/fav_button', product: product
            end
        end
    end
end
