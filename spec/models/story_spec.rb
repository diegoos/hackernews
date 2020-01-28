# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Story, type: :model do
  let(:top_stories) { described_class.all(2) }

  describe '.all' do
    context 'with two stories' do
      it { expect(top_stories.size).to eq(2) }
    end

    context 'when item is a Story instance' do
      it { expect(top_stories.first.class).to eq(described_class) }
    end

    context 'when item is not a top story' do
      let(:top_stories_ids) { HackerNewsApi.top_stories.parsed_response }
      let(:new_story_id) { described_class.all(1, :new).first.id }

      it do
        expect(top_stories_ids.include?(new_story_id)).to be_falsey
      end
    end
  end

  describe '.search' do
    let(:new_stories) { described_class.all(4, :new) }

    it 'when search term for third story from cache' do
      search_term = new_stories.third.title.split.first
      search = Story.search(search_term)

      expect(search.first.title).to eq(new_stories.third.title)
    end
  end

  describe '#comment_count' do
    it 'with five comments' do
      story = top_stories.first.dup
      story.comments = [1, 2, 3, 4, 5]

      expect(story.comments_count).to eq(5)
    end
  end
end
