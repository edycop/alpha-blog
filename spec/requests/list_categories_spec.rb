# frozen_string_literal: true

require 'rails_helper'

# Integration test list categories
RSpec.describe 'ListCategories', type: :request do
  describe 'GET /categories' do
    let!(:category1) { Category.new(name: 'SportsTV') }
    let!(:category2) { Category.new(name: 'TravelTV') }

    it 'shows the categories listing' do
      category1.save!
      category2.save!

      get categories_path

      expect(response.body).to match("href=\"#{category_path(category1)}\">#{category1.name}</a>")
      # expect(response.body).to match('href="/categories/1">Sports</a>')
      # assert_select 'a[href=?]', category_path(category1), text: "#{category1.name}"
      expect(response.body).to match("href=\"#{category_path(category2)}\">#{category2.name}</a>")
      # expect(response.body).to match('href="/categories/2">Travel</a>')
      # assert_select 'a[href=?]', category_path(category2), text: "#{category2.name}"
    end
  end
end
