require 'jwt'

class TokenService
  attr_accessor :clock

  def initialize
    @rsa_private = OpenSSL::PKey::RSA.generate 2048
    @rsa_public = @rsa_private.public_key
  end

  def encode payload
    toEncode = {:data => payload}
    JWT.encode toEncode, @rsa_private, 'RS256'
  end

  def decode payload
    JWT.decode payload, @rsa_public, true, { :algorithm => 'RS256' }
  end
end