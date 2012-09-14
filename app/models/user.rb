class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

   ROLES = %w[admin player]
 
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :encryptable
    
   has_and_belongs_to_many :roles  	
   
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_mem
  acts_as_authentic
  attr_accessible :name, :username, :password, :password_confirmation, :email, :role, :reset_password_token  
end
