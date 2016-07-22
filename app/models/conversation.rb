class Conversation < ActiveRecord::Base
  belongs_to :sender, :polymorphic => true
  belongs_to :recipient, :polymorphic => true
  belongs_to :specialized_field
  has_one :schedule_entity
  
  before_create do 
    self.token = self.generate_activation_code
  end
  
  after_create do
    self.generate_chat_file(self.token)
  end
  
  # Generates a random string from a set of easily readable characters
  def generate_activation_code(size = 40)
    charset = ([*('A'..'Z')] + [*('0'..'9')]-%w(0 B 1 I L O S U))
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
  
  def generate_chat_file(token)
    dir = Rails.root.join('public', 'chat')
    Dir.mkdir(dir) unless Dir.exist?(dir)
    File.open(dir.join("#{token}.txt"), 'wb') do |file|
      file.write("Hello.file............")
    end
  end
end
