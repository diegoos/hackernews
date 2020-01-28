# frozen_string_literal: true

namespace :hacker_news do # rubocop:disable Metrics/BlockLength
  namespace :cache do # rubocop:disable Metrics/BlockLength
    desc 'Update JSON cache with last stories'
    task :update_stories, [:story_type] do |_t, args|
      type = "#{args[:story_type]}_stories"
      stories = HackerNewsApi.send(type)

      cache = JSON.parse(File.read(cache_file(type)))
      last_story_id = cache.first['id']

      stories.each do |story|
        break if last_story_id == story

        cache.prepend HackerNewsApi.item(story).parsed_response
      end

      File.open(cache_file(type), 'w+') do |f|
        f.write(cache.to_json)
      end
    end

    desc 'Generate the JSON cache with all top and new stories. This task reset the cache if exist.' # rubocop:disable Layout/LineLength
    task :stories do
      top_stories = HackerNewsApi.retrieve_stories_data(15)
      new_stories = HackerNewsApi.retrieve_stories_data(nil, :new)

      # Generate top stories cache json
      File.open(cache_file('top_stories'), 'w+') do |f|
        f.write(top_stories.to_json)
      end

      # Generate new stories cache json
      File.open(cache_file('new_stories'), 'w+') do |f|
        f.write(new_stories.to_json)
      end
    end

    # Methods

    def cache_file(filename)
      cache_file = Rails.root.join('tmp', 'hacker_news', "#{filename}.json")
      cache_dir = File.dirname(cache_file)

      Dir.mkdir(cache_dir) unless File.directory?(cache_dir)

      cache_file
    end
  end
end
