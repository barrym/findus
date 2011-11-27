class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :authentication_token, :username

  before_save :ensure_authentication_token

  validates_uniqueness_of :username, :case_sensitive => false, :allow_blank => false
  validates_presence_of :username, :email

  has_many :posts

  def gravatar_url(options = {})
    options[:rating] ||= nil
    options[:size] ||= nil
    options[:default] ||= nil

    grav_url = 'http://www.gravatar.com/avatar.php?'
    grav_url << "gravatar_id=#{Digest::MD5.new.update(self.email)}"
    grav_url << "&rating=#{options[:rating]}" if options[:rating]
    grav_url << "&size=#{options[:size]}" if options[:size]
    grav_url << "&default=#{options[:default]}" if options[:default]
    grav_url
  end

end
