module ChatMessagesHelper
def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def chat_message_mapping
    @chat_message_mapping ||= chat_message.mappings[:user]
  end
end
