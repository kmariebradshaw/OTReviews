# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ title: 'Star Wars' }, { title: 'Lord of the Rings' }])
#   Character.create(title: 'Luke', movie: movies.first)

require 'csv'

csv_category_seed = File.read(Rails.root.join('lib', 'seeds', 'categories-seed.csv'))
csv_categories = CSV.parse(csv_category_seed, :headers => true, :encoding => 'ISO-8859-1')

csv_categories.each do | row | 
	t = Category.new
	t.name = row[0] 
	t.save
end 

csv_product_seed = File.read(Rails.root.join('lib', 'seeds', 'new-product-seed.csv'))
csv_products = CSV.parse(csv_product_seed, :headers => true, :encoding => 'ISO-8859-1')

csv_products.each do | row | 
	t = Product.new
	t.title = row[0] 
	t.category_id = row[1]
	t.save
end 

csv_review_text = File.read(Rails.root.join('lib', 'seeds', 'starter-reviews.csv'))
csv_review = CSV.parse(csv_review_text, :headers => true, :encoding =>'ISO-8859-1')

csv_review.each do | row | 
	t = Review.new
	t.text = row[0]
	t.title = row[1]
	t.rating = row[2]
	t.author_first = row[4]
	t.author_last = row[5]
	t.author_email = row[6]
	t.status = "approved"
	t.product_id = row[3]
	puts t.product_id
	t.save
	if t.save
		puts "review saved"
	else 
		puts "not saved" 
	end 
end 