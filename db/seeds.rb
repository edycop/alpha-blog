# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p 'Seeding the database ...'

Article.create(title: 'Elixir as the last functional programming language', description: 'This blog post is realated to Elixir programming language')
Article.create(title: 'Ruby 3 and hotwired', description: 'Hotwired has become an usefull tool to avoid Javascript scripts')

User.create(username: 'ecaldon', email: 'ecaldon@gmail.com')
