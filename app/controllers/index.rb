get '/' do
  private_page!
  @messages = Message.all
  if request.xhr?
    erb :_chatbox, locals: { messages: @messages }, layout: false
  else
    erb :chat
  end
end

post '/message/new' do
  message = Message.new(content: params[:message], sender: User.find(session[:user_id]))

  if message.save
      redirect('/')
  else
    redirect('/wtf')
  end

end

get '/json' do
  json a: 1, b: 2
end
