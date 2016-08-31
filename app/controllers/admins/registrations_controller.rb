# -*- coding: utf-8 -*-
class Admins::RegistrationsController < Devise::RegistrationsController
  layout 'admins/application'
    
  def after_update_path_for(resource)    
    admins_root_path
  end
  
  def after_sign_up_path_for(resource)
    admins_root_path
  end
end
