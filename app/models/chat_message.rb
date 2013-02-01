class ChatMessage < ActiveRecord::Base
  attr_accessible :date, :message, :name
  belongs_to :user
  attr_accessor :current_user
end
