get '/' do
  @messages = Message.all
  erb :chat
end
post 'message/new' do
  #..
end
