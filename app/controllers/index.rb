get '/' do
  private_page!
  @messages = Message.all
  if request.xhr?
    erb :_chatbox, locals: { messages: @messages }, layout: false
  else
    erb :chat
  end
end

get '/chatroom' do
  #..
end

get '/message/latest/:id' do |id|
  private_page!
  messages = Message.where('id > ?', id)
  content = erb :_chatbox, locals: {messages: messages}, layout: false

  if messages.empty?
    {}.to_json
  else
    { latest_id: messages.last.id,
      content: content }.to_json
  end
end

post '/message/new' do
  message = Message.new(content: params[:message], sender: User.find(session[:user_id]))

  if message.save && !request.xhr
      redirect('/')
  end
end
