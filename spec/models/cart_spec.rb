require 'rails_helper'

RSpec.describe Cart, type: :model do
  # add fixtures, in this case products
  fixtures :products

  # declare variable cart for using in tests later
  # subject declaration is the focus of the test,
  # which is why there are two different methods
  # for seemingly the same thing (talking bout let())
  subject(:cart) { Cart.new }

  # add products from fixture as variables
  # kinda declare variables too for later usage
  let(:book_one) { products(:ruby) }
  let(:book_two) { products(:two) }

  # describe is includes/wrapps around tests from same character
  describe 'add_product' do
    # adding multiple unique products
    context 'adding unique products' do
      # add items to cart before actual testing
      before do
        cart.add_product(book_one).save!
        cart.add_product(book_two).save!
      end

      # cart should have two line-items
      it 'has two line items' do
        expect(cart.line_items.size).to eq(2)
      end

      # check total price method by adding both products' prices and compare to
      # method
      it "has a total price of the two items' price" do
        expect(cart.total_price).to eq(book_one.price + book_two.price)
      end
    end

    # adding multiple unique products
    context 'adding duplicate products' do
      # add items to cart before actual testing
      before do
        cart.add_product(book_one).save!
        cart.add_product(book_one).save!
      end

      it 'has one line item' do
        expect(cart.line_items.size).to eq(1)
      end

      # cart should have two line-items
      it 'has a line item with quanitity of 2' do
        expect(cart.line_items.first.quantity).to eq(2)
      end

      # check total price method by adding both products' prices and compare to
      # method
      it "has a total price of the products' price times 2" do
        expect(cart.total_price).to eq(book_one.price * 2)
      end
    end
  end
end
