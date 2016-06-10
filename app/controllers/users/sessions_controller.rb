class Users::SessionsController < Devise::SessionsController
  layout 'users/application'
  def after_sign_in_path_for resource
    root_path
  end

  def after_sign_out_path_for resource
    new_user_session_path
  end

  def create
    super
  end
end
