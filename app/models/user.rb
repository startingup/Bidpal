class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

   ROLES = %w[admin dealer player]
 
   devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :encryptable
    
   has_and_belongs_to_many :roles
   has_many :chat_messages
   
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_mem, :last_request_at
  acts_as_authentic
  
  attr_accessible :name, :username, :password, :password_confirmation, :email, :role, :current_sign_in_at, :last_sign_out_at, :reset_password_token  
  
  def online?
    if current_sign_in_at.present? 
      last_sign_out_at.present? ? current_sign_in_at > last_sign_out_at : true
    else
      false
    end
  end

  
end
