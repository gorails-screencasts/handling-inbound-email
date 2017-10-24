ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: Rails.application.secrets.sendgrid_password,
  domain: 'domain.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

