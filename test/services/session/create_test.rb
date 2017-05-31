require 'test_helper'

class Session::CreateTest < ActiveSupport::TestCase
  test 'should create a session' do
    user = users :user

    context = nil
    params = { user_agent: 'Test', remote_ip: '127.0.0.1', data: { type: 'sessions', attributes: { email: user.email, password: user.role } } }
    result = Session::Create.run(context: context, params: params)

    assert_equal true, result.valid?
  end

  test 'should require an email' do
    user = users :user

    context = nil
    params = { user_agent: 'Test', remote_ip: '127.0.0.1', data: { type: 'sessions', attributes: { password: user.role } } }
    result = Session::Create.run(context: context, params: params)

    assert_equal false, result.valid?
    assert_equal 1, result.errors.length
    error = result.errors.first
    assert_equal 'Validation Error', error.title
    assert_equal '/data/attributes/email', error.source[:pointer]
  end

  test 'should require a password' do
    user = users :user

    context = nil
    params = { user_agent: 'Test', remote_ip: '127.0.0.1', data: { type: 'sessions', attributes: { email: user.email } } }
    result = Session::Create.run(context: context, params: params)

    assert_equal false, result.valid?
    assert_equal 1, result.errors.length
    error = result.errors.first
    assert_equal 'Validation Error', error.title
    assert_equal '/data/attributes/password', error.source[:pointer]
  end

  test 'should require a valid email' do
    user = users :user

    context = nil
    params = { user_agent: 'Test', remote_ip: '127.0.0.1', data: { type: 'sessions', attributes: { email: 'wrong@wrong.com', password: user.role } } }
    result = Session::Create.run(context: context, params: params)

    assert_equal false, result.valid?
    assert_equal 1, result.errors.length
    error = result.errors.first
    assert_equal 'Validation Error', error.title
    assert_equal '/data/attributes/email', error.source[:pointer]
  end
end
