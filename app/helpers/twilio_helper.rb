module TwilioHelper
  def twilio_helper
    account_sid = ENV["SID"]
    auth_token = ENV["TOKEN"]

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    # alternatively, you can preconfigure the client like so
    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    # and then you can create a new client without parameters
    @client = Twilio::REST::Client.new
  end

  def self.send_confirmation_to(user)
    verification_code = CodeGenerator.generate
    user.update(verification_code: verification_code)
    MessageSender.send_code(user.phone, verification_code)
  end

  def send_code
    @client.api.account.messages.create(
      from: '+16508661799',
      to: '+14084728719',
      body: 'Hi!')
    end
end
