class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :crypted_password,	:null => true 
      t.string :password_salt,	:null => true  
      t.string :persistence_token,	:null => true  

      t.timestamps
    end
  end
end
