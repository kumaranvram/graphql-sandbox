require 'test_helper'

class Mutations::SignInUserTest < ActiveSupport::TestCase 
    def perform(args = {})
        Mutations::SignInUser.new(object: nil, context: {session: {} }).resolve(args)
    end

    def create_user
        User.create!(
            name: 'Test User',
            email: 'testuser@example.com',
            password: 'test-password'
        )
    end

    test 'signin success' do
        user = create_user

        result = perform(
            email: {
                email: user.email,
                password: user.password
            } 
        )

        assert result[:token].present?
        assert_equal user, result[:user]
    end

    test 'signin failure - no credentials' do
        assert_nil perform
    end

    test 'signin failure - wrong email' do
        create_user
        assert_nil perform(email: { email: 'something-else@example.com' } )
    end

    test 'signin failure - invalid credentials' do
        user = create_user
        assert_nil perform(email: { email: user.email, password: 'something else' } )
    end
end