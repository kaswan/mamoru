class Specialists::SessionsController < Devise::SessionsController
  layout 'specialists/application'
  def after_sign_in_path_for resource
    specialists_root_path
  end

  def after_sign_out_path_for resource
    new_specialist_session_path
  end

  def create
    super
  end
end
