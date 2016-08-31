# -*- coding: utf-8 -*-
class Specialists::RegistrationsController < Devise::RegistrationsController
  layout 'specialists/application'
  
  def after_update_path_for(resource)    
    specialists_profiles_path
  end
  
  def after_sign_up_path_for(resource)
    specialists_root_path
  end
end
