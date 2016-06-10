class Admins::ApplicationController < ApplicationController
  before_filter :not_found_if_not_broz
  before_filter :authenticate_admin_user!
  before_filter :session_check
  before_filter :set_domain
  layout 'admins/application'

  private
  def session_check
    render :text => 'OK' if params[:mamoru_session_check]
  end
  
  def set_domain
    @domain = :admin
  end

  def self.not_found_if_not_broz remote_ip
    ApplicationController.not_found if remote_ip != '121.119.247.177' and remote_ip != '121.119.247.176' and !private_ip?(remote_ip)
  end

  def self.private_ip? target
    IPAddr.new("10.0.0.0/8").include?(target) ||
    IPAddr.new("172.16.0.0/12").include?(target) ||
    IPAddr.new("192.168.0.0/16").include?(target)
  end

  private
  def not_found_if_not_broz
    Admins::ApplicationController.not_found_if_not_broz request.remote_ip
  end
end
