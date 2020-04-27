require 'digest'
module CartHelper
  def calculateChk(dotpay_pin, dotpay_id, amount, currency, description, channel, url, type, firstname, lastname, email, bylaw, personal_data)
    text = dotpay_pin + dotpay_id + amount + currency + description + channel + url + type + firstname + lastname + email + bylaw + personal_data
    chk = Digest::SHA256.hexdigest(text)
  end
  def receive_payment_methods
    uri = URI.parse("https://ssl.dotpay.pl/test_seller/api/v1/accounts/770516/channels/?lang=pl")
    request = Net::HTTP::Get.new(uri)
    request.basic_auth(Rails.application.credentials.dig(:payments, :username), Rails.application.credentials.dig(:payments, :password))
    req_options = {
      use_ssl: uri.scheme == "https",
    }
    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    payment_methods = JSON.parse(response.body)
    banks = {}
    payment_methods.each do |p|
      if !p["is_disabled"] && !p["is_blocked_by_seller"]
        logo = "<span class=\"w-4 h-4 inline-block mr-1 rounded-full border border-gray-800\"></span>#{image_tag p["logo"]}".html_safe
        banks["#{p["id"]}"] = logo
      end
    end
    banks
  end

end
