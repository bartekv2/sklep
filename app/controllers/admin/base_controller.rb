class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :authenticate

  def authenticate
    authenticate_or_request_with_http_basic 'Podaj hasło!' do |name, password|
      #name == ENV['SKLEP_NAME'] && password == ENV['SKLEP_PASSWORD']
      name == 'bartek' && password == 'tragediaW4aktach'
    end
  end
end
