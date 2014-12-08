class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def send_msgs
    
  end

  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: 'twilio_no', to: 'verified_twilio_no', body: "#{params[:message]}"
    render plain: message.status
  end

end
