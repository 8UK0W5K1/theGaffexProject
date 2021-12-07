# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_PUBLIC'],
  password: ENV['SENDGRID_SECRET'],
  domain: 'gaffex.dev@gmail.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
# Initialize the Rails application.
Rails.application.initialize!
