require 'dotenv/rails-now'

class TwilioController < ApplicationController
  def send_sms
    messages = [*('a'..'z'),*('0'..'9')].shuffle[0,8].join
    @teacher = Teacher.find(admin_access_params["teacher"].to_i)
    @teacher.admin_code = messages
    @teacher.save
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @messages = @client.account.messages.create({:to => "+1"+"6505338971",
                                                  :from => "+16508661799",
                                                  :body => "Your access code to be an admin: #{messages}"})
  redirect_to admins_path
  end

private
  def admin_access_params
    params.permit("teacher")
  end
end
