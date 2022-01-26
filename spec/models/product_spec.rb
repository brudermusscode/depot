require 'rails_helper'

RSpec.describe Product, type: :model do
  fixtures :products

  subject(:product) { Product.new }

  let(:fproduct) { products(:ruby) }
  let(:sproduct) { products(:one) }

  describe 'add product' do
    context 'adding single product' do
    end
  end
end
