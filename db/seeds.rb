# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Loading data..."

Author.destroy_all

robert = Author.create(first_name: "Robert", last_name: "Heinlein")
robert.books.create(title: "Stranger in Strange Land")

jk = Author.create(first_name: "JK", last_name: "Rowling")
jk.books.create(title: "Harry Potter 1")
jk.books.create(title: "Harry Potter 2")
jk.books.create(title: "Harry Potter 3")

puts "Seed complete!"