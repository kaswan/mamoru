class Users::ApplicationController < ApplicationController  
  before_filter :authenticate_user!
  layout 'users/application'
 
end
