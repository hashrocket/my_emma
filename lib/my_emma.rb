$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rubygems'
require 'core_ext'
require 'httparty'
require 'httparty_ext'
require 'rfc822'

class MyEmma
  autoload :Response, 'my_emma/response'

  include HTTParty
  base_uri "https://app.e2ma.net"

  class Error < RuntimeError; end

  REQUIRED_CREDENTIALS = [
    'emma_account_id',
    'signup_post',
    'username',
    'password',
  ].sort.freeze

  def self.signup(email, parameters={})
    if email_valid?(email)
      parameters.merge! credentials.merge(:emma_member_email => email)
      Response.new post('/app/view:RemoteSignup', :query => parameters)
    end
  end

  def self.credentials=(h={})
    h.stringify_keys!
    raise Error, "Missing required credential(s): #{(REQUIRED_CREDENTIALS - h.keys.sort).inspect}" unless h.keys.sort == REQUIRED_CREDENTIALS
    @@credentials = h
  end

  def self.credentials
    @@credentials ||= {}
  end

  private

  def self.email_valid?(email)
    email && email =~ RFC822::EmailAddress
  end
end
