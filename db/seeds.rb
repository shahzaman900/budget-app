# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
u1 = User.create(name: 'Shah', surname: 'Zaman')

cat1 = Category.create(name: 'School', icon: 'Photo', user: u1)
cat2 = Category.create(name: 'Rent', icon: 'Photo', user: u1)
cat3 = Category.create(name: 'shopping', icon: 'Photo', user: u1)

trans1 = Purchase.create(name: 'Lunch', amount: 10, author_id: u1.id, categories_id: cat1.id)

trans2 = Purchase.create(name: 'House rent', amount: 100.50, author_id: u1.id, categories_id: cat2.id)

trans3 = Purchase.create(name: 'Rice', amount: 100, author_id: u1.id, categories_id: cat3.id)