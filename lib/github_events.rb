# frozen_string_literal: true

require_relative 'api_service'

class GithubEvents
  EVENT_COUNT_INCREMENT = 1

  def initialize(user)
    @user = user
  end

  def public_events
    event_api_url = "https://api.github.com/users/#{@user}/events/public"
    ApiService.new(event_api_url).json_response
  end

  def events_map
    events_map = Hash.new(0)
    public_events.each do |event|
      next if event['type'].nil?

      events_map[event['type']] += EVENT_COUNT_INCREMENT
    end

    events_map
  end
end
