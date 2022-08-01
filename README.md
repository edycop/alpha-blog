# Alpha-blog

This web application is a result of the course [The Complete Ruby on Rails Course](https://www.udemy.com/course/the-complete-ruby-on-rails-developer-course) on Udemy platform. The only difference is that I used [RSpec](https://rspec.info/) as test framework instead of [Minitest](http://docs.seattlerb.org/minitest/).

You can see an oline demo of this app on [alpha-blog-1001.herokuapp.com](https://alpha-blog-1001.herokuapp.com/).

## Software version

- Ruby: 3.1.2
- rake: 13.0.6
- Rails: 7.0.3.1
- RSpec: 3.11.0
- sqlite3: 1.4.4

### Deployment instructions

- You must install Ruby with rbenv or another Ruby manager.
- Install sqlite3 to create the database
- Clone this repository
- Execute `bundle install` to install all dependences.
- Run `rails db:setup` to create and and migrate the DB schema.
- Edit `db/seeds.rb` to create the first data in your app
- Run `rails db:seed` to load the initial data.
- `rails s` to launch the web app.

Finally visit http://localhost:3000/ in the web browser to interact with the app.
