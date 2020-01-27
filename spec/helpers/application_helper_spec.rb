# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.format_date' do
    context 'When format timestamp' do
      it do
        timestamp = 1_577_884_200 # 01/01/2020 10:10

        expect(helper.format_date(timestamp)).to eq('01/01/2020 10:10')
      end
    end
  end
end
