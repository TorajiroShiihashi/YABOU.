ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  fixtures :all
  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
<<<<<<< HEAD
    !session[:user_id].nil?
=======
   !session[:user_id].nil?
>>>>>>> updating-users
  end

  # テストユーザーとしてログインする
  def log_in_as(user)
    session[:user_id] = user.id
  end
<<<<<<< HEAD
=======

>>>>>>> updating-users
end

class ActionDispatch::IntegrationTest
  # テストユーザーとしてログインする
  def log_in_as(user, password: 'password', remember_me: '1')
<<<<<<< HEAD
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
=======
  post login_path, params: { session: { email: user.email,
                                        password: password,
                                        remember_me: remember_me } }
>>>>>>> updating-users
  end
end
