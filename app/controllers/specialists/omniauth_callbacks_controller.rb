class Specialists::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_specialist!
  
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
    
    @specialist = Specialist.find_for_oauth(request.env['omniauth.auth'])

    if @specialist.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
      sign_in  @specialist, event: :authentication 
      redirect_to specialists_root_path 
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth']
      redirect_to new_specialist_registration_url
    end
  end
end
