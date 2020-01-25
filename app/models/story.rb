# frozen_string_literal: true

class Story
  include ActiveModel::Model

  attr_accessor :by, :descendants, :id, :kids, :score,
                :time, :title, :type, :url

  def self.get(limit = 10)
    @_get ||= begin
                HackerNewsApi.retrieve_stories_data(limit).map do |story|
                  Story.new(story)
                end
              end
  end
end
