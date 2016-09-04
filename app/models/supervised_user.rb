class SupervisedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin_user
  
  validates_uniqueness_of :admin_user_id, scope: [:admin_user_id, :user_id]  
    
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
      file.write("")
    end
  end
end
