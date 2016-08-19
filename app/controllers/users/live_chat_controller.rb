class Users::LiveChatController < Users::ApplicationController

  def index    
  end
  
  def show
  end
  
  def update
  end
  def connect
    if params[:state] && !params[:room].blank?
      @file = getChatfilePath(params[:room]);
      if params[:state] == 'getState'
        @log['state'] = getlines(getfile(@file));
                       
      end
    end
    render layout: false if request.xhr?
  end

  private
  
  def getChatfilePath token
    dir = Rails.root.join('public', 'chat')
    Dir.mkdir(dir) unless Dir.exist?(dir)    
  end
  
  def getlines    
  end
    
  def getfile
  end
end
