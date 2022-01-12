require "test_helper"

class ProductTest < ActiveSupport::TestCase

	fixtures :products

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:image_url].any?
		assert product.errors[:price].any?
	end

	test "product is not valid without a unique title - i18n" do
		product = Product.new(title: products(:ruby).title,
		description: "yyy",
		price: 1,
		image_url: "fred.gif")
		assert product.invalid?
		assert_equal [I18n.translate('errors.messages.taken')],
		product.errors[:title]
	end
		

	test "product price must be positive" do

		# first we create a new product for the test case
		product = Product.new(
			title: "My Book Title",
			description: "yyy",
			image_url: "zzz.jpg"
		)

		# set the price to -1
		product.price = -1
		#shall be invalid
		assert product.invalid?
		# and check if the error output matches...
		assert_equal ["must be greater than or equal to 0.01"],
			# the actual one
			product.errors[:price]
		
		# set price to 0
		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"],
			product.errors[:price]

		# set price to 1
		product.price = 1
		# should be valid, nothing happens, no error output
		assert product.valid?
	end

	def new_product(image_url)
		Product.new(title: "My Book Title",
		description: "yyy",
		price: 1,
		image_url: image_url)
	end

	test "image url" do

		ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
		http://a.b.c/x/y/z/fred.gif }
		bad = %w{ fred.doc fred.gif/more fred.gif.more }

		ok.each do |image_url|
			assert new_product(image_url).valid?,
			"#{image_url} shouldn't be invalid"
		end

		bad.each do |image_url|
			assert new_product(image_url).invalid?,
			"#{image_url} shouldn't be valid"
		end
	end

	test "product title invalid length" do
		product = Product.new(
			description: products(:ruby).description,
			image_url: products(:ruby).image_url,
			price: products(:ruby).price
		)

		product.title = "aaa"
		assert product.invalid?
		assert_equal ["is too short (minimum is 10 characters)"],
			product.errors[:title]

		a = 0
		
		# create random title with 201 char length
		product.title = (0...201).map { (65 + rand(26)).chr }.join;

		assert product.invalid?
		assert_equal ["is too long (maximum is 200 characters)"],
			product.errors[:title]

		product.title = "aaaaaaaaaaa"
		assert product.valid?

	end
end