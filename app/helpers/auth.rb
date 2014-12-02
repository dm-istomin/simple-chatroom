def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def logged_in?
  session[:user_id] != nil
end

def protected!
  redirect('/login') unless logged_in?
end
