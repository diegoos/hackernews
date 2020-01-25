# frozen_string_literal: true

module RetrieveStories
  extend ActiveSupport::Concern

  class_methods do
    # Get all top stories
    def retrieve_stories(limit)
      top_stories = HackerNewsApi.top_stories

      return [] unless top_stories.code == 200

      all_stories = []

      top_stories.first(limit).each do |story|
        all_stories << HackerNewsApi.item(story).parsed_response
      end

      all_stories
    end
  end
end
