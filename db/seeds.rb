# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
library = Library.create(name: 'Public Library')
user = User.create(email: "sample@test.com", password: "Password")
Book.create(title: 'Book 1', available: true, library: library)
Book.create(title: 'Book 2', available: true, library: library)
Book.create(title: 'Book 3', available: false, user_id: user.id, library: library)
