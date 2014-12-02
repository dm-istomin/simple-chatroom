get '/' do
  protected!
  @messages = Message.all
  erb :chat
end

post '/message/new' do
  message = Message.new(content: params[:message], sender: User.find(session[:user_id]))

  if message.save
    redirect('/')
  else
    redirect('/wtf')
  end

end
