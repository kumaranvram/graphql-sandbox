require 'test_helper'

class Mutations::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Mutations::CreateUser.new(object: nil, context: {}).resolve(args)
  end

  test 'create new user' do
    user = perform(
      name: 'Test User',
      auth_provider: {
        email: {
          email: 'email@example.com',
          password: 'password'
        }
      }
    )

    assert user.persisted?
    assert_equal 'Test User', user.name
    assert_equal 'email@example.com', user.email
  end
end