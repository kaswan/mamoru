class Users::LiveChatController < Users::ApplicationController

  def index    
  end
  
  def show
  end
  
  def update
  end
  def connect
    render layout: false if request.xhr?
  end
#  def process
#    render layout: false if request.xhr?
#  end
end
