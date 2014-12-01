get '/' do
  @messages = Message.all
  erb :chat
end
