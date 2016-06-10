class Specialists::ApplicationController < ApplicationController  
  before_filter :authenticate_specialist!
  layout 'specialists/application'
 
end
