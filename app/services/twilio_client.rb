class TwilioClient
  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(user, message)
    client.api.messages.create(
     to: +919340875004,
     from: phone_number,
     body: message
    )
  end

  private

  def account_sid
    Rails.application.secrets.twilio[:account_sid]
  end

  def auth_token
    Rails.application.secrets.twilio[:auth_token]
  end

  def phone_number
    Rails.application.secrets.twilio[:phone_number]
  end
end
