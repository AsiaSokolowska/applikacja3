class Person < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone, presence: true
  validates :phone, format: {with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{3})/ }

  before_save :set_nickname, unless: :is_my_name?
  before_validation :normalize_phone

    #after_save :normalize_phone

DIRTY_WORDS = %w(kupa dupa siusiak)

  private

  def nickname_dirty?
    DIRTY_WORDS.include?(self.nickname.downcase)
  end


  def is_my_name?
    self.first_name.downcase == "asia"
  end


  def set_nickname
    self.nickname = self.first_name.reverse.downcase.titleize
     false if nickname_dirty?
  end


  def normalize_phone
    self.phone.gsub!(/[^0-9]/,"")
    #self.save #przy after_save
  end

  #PHONE_REGEXP<-- wrazenie reguralnie np czy telefon jest telefonem a email emailem itd
end
