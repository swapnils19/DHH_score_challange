# frozen_string_literal: true

require_relative 'github_events'

class ScoreCalculation
  BASE_SCORE = {
    'IssuesEvent' => 7,
    'IssueCommentEvent' => 6,
    'PushEvent' => 5,
    'PullRequestReviewCommentEvent' => 4,
    'WatchEvent' => 3,
    'CreateEvent' => 2
  }.freeze

  OTHER_EVENT_SCORE = 1

  def initialize(user)
    @user = user
  end

  def total_score
    score_map.sum
  end

  private

  def score_map
    GithubEvents.new(@user).events_map.map { |event, count| count * (BASE_SCORE[event] || OTHER_EVENT_SCORE) }
  end
end
