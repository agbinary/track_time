class SessionsController < ApplicationController
  def create
    uid = auth_hash.uid
    nickname = auth_hash.info.nickname
    name = auth_hash.info.name
    token = auth_hash.credentials.token
    secret = auth_hash.credentials.secret
    user = User.find_or_initialize_by(uid: uid, nickname: nickname, name: name, token: token, secret: secret)
    if user.new_record? && !user.save
      redirect_to :root, notice: 'Oops, something went wrong. Try again.'
    else
      session[:user_id] = user.id
      redirect_to :activities, notice: 'Signed in!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: 'Logged out!'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
