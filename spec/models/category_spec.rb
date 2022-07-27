# frozen_string_literal: true

require 'rails_helper'

# Unit test for Category model
RSpec.describe Category, type: :model do
  let(:category) { Category.new(name: 'Sports') }

  describe '.new' do
    context 'when name is valid' do
      it 'returns true' do
        expect(category.valid?).to be(true)
      end
    end

    context 'when name is empty' do
      it 'return false' do
        category.name = ''
        expect(category.valid?).to be(false)
      end
    end

    context 'when name is no unique' do
      it 'return false' do
        category.save
        category2 = Category.new(name: 'Sports')
        expect(category2.valid?).to be(false)
      end
    end

    context 'when name is too short' do
      it 'return false' do
        category.name = 'so'
        expect(category.valid?).to be(false)
      end
    end

    context 'when name is too long' do
      it 'return false' do
        category.name = 'This category name is long'
        expect(category.valid?).to be(false)
      end
    end
  end
end
