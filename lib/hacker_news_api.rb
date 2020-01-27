# frozen_string_literal: true

# Hacker News API module
module HackerNewsApi
  include HTTParty
  base_uri 'https://hacker-news.firebaseio.com/v0'

  module_function

  # Get items from Hacker News API
  def item(id)
    get("/item/#{id}.json")
  end

  # Get top stories id list
  def top_stories
    get('/topstories.json')
  end

  # Retrieve the stories data from API
  def retrieve_stories_data(limit = nil)
    response = top_stories

    return [] unless response.code == 200

    stories = limit ? response.first(limit) : response

    all_stories = []

    stories.each do |story|
      item = item(story).parsed_response
      all_stories << item if item['type'] == 'story'
    end

    all_stories
  end

  # Load stories from JSON cache
  def load_stories_cache
    cache_file = Rails.root.join('tmp', 'hacker_news', 'top_stories.json')

    return nil unless File.exist?(cache_file)

    JSON.parse(File.read(cache_file))
  end
end
