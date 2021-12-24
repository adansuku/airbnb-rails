class Users::OmniauthCallbacksController < ApplicationController
    def google
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
            flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        else
            session["devise.google_data"] = request.env["omniauth.auth"].except(:extra) 
            redirect_to new_user_registration_url
        end
    end

    def failure
        redirect_to root_path
    end

end
