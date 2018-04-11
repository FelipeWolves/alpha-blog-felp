require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "should sign up a new user" do
  get signup_path
  assert_template 'users/new'
  assert_difference 'User.count', 1 do
    post users_path, params: { user: { username: "another", email: "another@example.com", password: "another"}}
    follow_redirect!
    end
  assert_template 'users/show'
  assert_match 'another', response.body
  end
end
