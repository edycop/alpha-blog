# frozen_string_literal: true

require 'rails_helper'

# Integration test for create a new category
RSpec.describe 'CreateCategories', type: :request do
  describe 'GET a new category form and create category' do
    subject { post categories_path(params: { category: { name: 'Sports' } }) }

    it 'works!' do
      get new_category_path
      expect(response).to have_http_status(:success)

      expect { subject }.to change { Category.count }.by(1)

      # These three next lines do the same
      # expect(subject).to redirect_to(category_path(assigns(:category)))
      expect(response).to have_http_status(:redirect)
      # expect(response).to redirect_to "/categories/#{assigns(:category).id}"

      follow_redirect!

      # These two next lines do the same
      expect(response).to have_http_status(:success)
      # expect(response).to render_template(:show)

      expect(response.body).to match('Sports')
    end
  end

  describe 'GET a new category form and reject invalid category submission' do
    subject { post categories_path(params: { category: { name: ' ' } }) }

    it 'works!' do
      get new_category_path
      expect(response).to have_http_status(:success)

      expect { subject }.to_not change { Category.count }

      expect(response.body).to match('errors')
      # assert_select 'div.alert'
      expect(response.body).to match(
        '<div class="alert alert-danger d-flex align-items-center alert-dismissible fade show" role="alert">'
      )
      # assert_select 'h4.alert-heading'
      expect(response.body).to match('<h4 class="alert-heading">')
    end
  end
end
