class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.string :name
      t.datetime :date
      t.text :message

      t.timestamps
    end
  end
end
