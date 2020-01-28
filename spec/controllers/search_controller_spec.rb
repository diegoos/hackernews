# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe 'GET #show' do
    context 'with http success' do
      it do
        get :show
        expect(response).to have_http_status(:success)
      end
    end

    context 'when render the show template' do
      it do
        get :show
        expect(response).to render_template('show')
      end
    end
  end
end
