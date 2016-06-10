class Admins::SessionsController < Devise::SessionsController
  layout 'admins/application'
  def after_sign_in_path_for resource
    admins_root_path
  end

  def after_sign_out_path_for resource
    new_admin_user_session_path
  end

  def create
    super
  end
end
