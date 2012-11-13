class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :authentications 
  has_many :followers
  
  has_many :messages
  has_many :categories
  has_many :stages
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :about, :image, :name, :gender, :interest, :hometown, :birthdate ,:image_fb
  has_attached_file :image, :styles => {:thumb => { :geometry => '75x75>', :quality => 50},:normal => { :geometry => '298x350>', :quality => 50}, :profile => { :geometry => '298x350>', :quality => 50}},:path => "/users/:style/:id/:filename"

  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  def password_required?  
    (authentications.empty? || !password.blank?) && super  
  end
end
