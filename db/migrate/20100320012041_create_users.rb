class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.authenticatable :encryptor => :sha1, :null => false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      
      t.timestamps
    end
  end
  
  add_index :users, :email,                :unique => true
  add_index :users, :confirmation_token,   :unique => true
  add_index :users, :reset_password_token, :unique => true
  # add_index :users, :unlock_token,         :unique => true

  def self.down
    drop_table :users
  end
end
