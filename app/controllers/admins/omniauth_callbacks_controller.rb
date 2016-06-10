class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_admin_user!
  
  def facebook
    callback_from
  end

  def yahoojp
    callback_from
  end

  def google
    callback_from
  end
    
  def callback
    callback_from
  end
  
  def sync
    callback_from
  end
    
  private

  def callback_from
    provider = request.env['omniauth.auth']['provider']
    
    @admin = AdminUser.find_for_oauth(request.env['omniauth.auth'])

    if @admin.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in  @admin, event: :authentication 
      redirect_to admins_root_path 
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_admin_user_registration_url
    end
  end
end
