# frozen_string_literal: true

require 'net/http'
require 'json'

class ApiService
  def initialize(api_url_path)
    @api_url_path = api_url_path
  end

  def complete_response
    https_request.start { |https| https.request(request_get) }
  end

  def json_response
    JSON.parse(complete_response.body)
  end

  private

  def https_request
    url = build_url
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    https
  end

  def request_get
    Net::HTTP::Get.new(build_url.path)
  end

  def build_url
    URI(@api_url_path)
  end
end
