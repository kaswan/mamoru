class UserProfile < ActiveRecord::Base
  belongs_to :user
  belongs_to :prefecture
  has_many :inheritor_inforamtions, :through => :user
  
  validates :name, presence: true
  validates :furigana, presence: true
  validates :postalcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true
  validates :address, presence: true
  
  # before_validation
  before_validation :replace_postalcode, :if => Proc.new {|profile| !profile.postalcode.blank?}
  before_validation :replace_address, :if => Proc.new {|profile| !profile.address.blank?}
  before_validation :strict_furigana
  
  before_validation :postal_format, :if => Proc.new {|profile| !profile.postalcode.blank?}
    
    
  # before_validation
  # postalcodeを半角数字に変換&スペース削除
  def replace_postalcode
    if self.postalcode
      self.postalcode = self.postalcode.tr("０-９","0-9").gsub(/－/,"-").gsub(/ー/,"-").gsub(/ｰ/,"-").gsub(/―/,"-").gsub(/　/,"").gsub(/\s/,"")
    end
  end
  
  # before_validation
  # founding_yearを半角数字に変換&スペース削除
  def replace_address
    if self.address
      #self.address = self.address.tr("０-９","0-9").gsub(/　/,"").gsub(/\s/,"")
      self.address = self.address.tr("０-９","0-9").tr("　"," ").lstrip.rstrip
    end
  end

  # after_validation
  # postal成形
  def postal_format
    if self.postalcode &&  /\A[0-9]{7}\z/ =~ self.postalcode
      arr = self.postalcode.unpack('a3a4')
      self.postalcode = arr.first.concat('-').concat(arr.second)
    end
  end
  
  # yomiganaを全角ひらがなに変換
  def strict_furigana
    self.furigana = self.furigana.tr("ァ-ン","ぁ-ん") if self.furigana
  end
end
