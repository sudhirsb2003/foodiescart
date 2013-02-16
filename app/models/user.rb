class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :comments
  has_many :recipes
  
  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      #raise ActiveRecord::Rollback
      raise "Can't delete last user'"
    end
  end



end
