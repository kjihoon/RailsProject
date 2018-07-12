# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  def facebook
    p "********************************"
    p request.env['omniauth.auth']
    p "********************************"
    #<OmniAuth::AuthHash credentials=
    #<OmniAuth::AuthHash expires=true expires_at=1536372457 token="*********">
    #extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash email="romancedandelion@gmail.com" id="***********" name="Takhee Kim">>
    #info=#<OmniAuth::AuthHash::InfoHash
    #   email="romancedandelion@gmail.com"
    #   image="http://graph.facebook.com/v2.10/1735946999835206/picture"
    #   name="Takhee Kim">
    # provider="facebook"
    # uid="************">
    auth = env['omniauth.auth']
    @user = User.find_auth(auth, current_user)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_path
    end
  end

  def kakao
    p "********************************"
    p request.env['omniauth.auth']
    p "********************************"
    #<OmniAuth::AuthHash credentials=
    #<OmniAuth::AuthHash expires=true expires_at=1536372457 token="*********">
    #extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash email="romancedandelion@gmail.com" id="***********" name="Takhee Kim">>
    #info=#<OmniAuth::AuthHash::InfoHash
    #   email="romancedandelion@gmail.com"
    #   image="http://graph.facebook.com/v2.10/1735946999835206/picture"
    #   name="Takhee Kim">
    # provider="facebook"
    # uid="************">
    auth = env['omniauth.auth']
    @user = User.find_auth(auth, current_user)
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_path
    end
  end


  def after_sign_in_path_for(resource)
    auth = request.env['omniauth.auth']
    @identity = Identity.find_auth(auth)
    @user = User.find(current_user.id)
    if @user.persisted?
      if auth.provider == 'kakao' && @user.email.empty?
        return users_info_path
      end
    end
    '/'
  end









  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
