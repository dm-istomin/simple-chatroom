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
  p new_user
  if new_user.save
    p new_user
    session[:user_id] = new_user.id
    redirect('/')
  else
    p new_user
    redirect('/asdfasdfsad')
  end
end
