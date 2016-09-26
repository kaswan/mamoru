class Specialists::LiveChatController < Specialists::ApplicationController

  def index    
  end
  
  def show
  end
  
  def talk
  end
  
  def chat_update
    state = params[:state]
    file = getChatfilePath(params[:room])
    finish = Time.now + 0.1
    count = getlines(getfile(file))
    while count.to_i <= state.to_i do
      sleep 0.01
      if Time.now <= finish 
        count = getlines(getfile(file))
      else 
        break
      end  
    end    
    text = []
    if state.to_i != count.to_i 
      line_num = 0
      getfile(file).each do |line|
        line_num += 1
        if line_num.to_i > state.to_i
          text << line.gsub("\n", "")
        end
      end
      state = count
    end
    respond_to do |format|
      msg = { :state => state, :text => text }
      format.json  { render :json => msg }
    end 
  end
  
  def connect
    if params[:task] && !params[:room].blank?
      
      if params[:task] == 'getState'
        file = getChatfilePath(params[:room]);
        state = getlines(getfile(file)); 
        respond_to do |format|
          msg = { :state => state }
          format.json  { render :json => msg }
        end
      elsif params[:task] == 'send'
        blankexp = "/^\n/"
        #message = strip_tags(params[:message])
        message = params[:message]
               
        unless message.match(blankexp) 
          if urls = URI.extract(message, ['http', 'https'])
            urls.each do |url|
              message = message.gsub(url, "<a href=#{url} target='_blank'>#{url}</a>")
            end
          end
          #message = message.gsub(patterns, replacements);
          if current_specialist.try(:image) 
            profile_image_path = current_specialist.image.url(:icon)
          else  
            profile_image_path = '/assets/mypage/user.png';
          end
          message = message.gsub(/(\r\n|\r|\n)/, "<br />")
          file = getChatfilePath(params[:room]);
          File.open(file, 'a') do |file|
            file.write("<div class='chat-box'><div class='chat-face'><img src=#{profile_image_path} alt='担当者名' width='80' height='80'></div><div class='chat-area'><div class='chat-editor'><div class='name'>#{current_specialist.name}</div><div class='date'>#{(l Time.now, format: :day_hour_minute)} </div></div><div class='chat-hukidashi'>#{message} </div></div></div>\n")
          end
        end
        respond_to do |format|
          msg = { :state => '' }
          format.json  { render :json => msg }
        end
      end
    end
    
    #render layout: false if request.xhr?
  end

  private
  
  def getChatfilePath token
    dir = Rails.root.join('public', 'chat')
    Dir.mkdir(dir) unless Dir.exist?(dir)  
    if File.exist?(dir.join("#{token}.txt"))
      return dir.join("#{token}.txt")
    end  
  end
  
  def getlines file    
    return file.readlines.size
  end
    
  def getfile path
    return File.open(path,"r")
  end
end
