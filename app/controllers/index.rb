get '/' do
  protected!
  @messages = Message.all
  erb :chat
end
post 'message/new' do
  #..
end
