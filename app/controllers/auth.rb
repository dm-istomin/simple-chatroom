get '/logout' do
  session[:user_id] = nil
  redirect ('/login')
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(name: params[:username])

  if user.try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect('/')
  else
    session[:errors] = "Invalid login"
    redirect('/login')
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:user_id] = user_id
    redirect('/')
  else
    redirect('/asdfasdfsad')
  end
end
