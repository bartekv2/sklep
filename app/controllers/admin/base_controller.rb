class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic 'Podaj hasło!' do |name, password|
      name == Rails.application.credentials.dig(:admin, :name) && password == Rails.application.credentials.dig(:admin, :password)
    end
  end
end
