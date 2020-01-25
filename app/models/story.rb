# frozen_string_literal: true

class Story
  include ActiveModel::Model
  include HackerNewsApi
  include RetrieveStories

  attr_accessor :by, :descendants, :id, :kids, :score,
                :time, :title, :type, :url

  def self.get(limit)
    @_get ||= begin
      retrieve_stories(limit).map do |story|
        Story.new(story)
      end
    end
  end
end
