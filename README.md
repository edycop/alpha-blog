# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


app/views/articles/index.html.erb
<div id="articles">
  <% @articles.each do |article| %>
    <%= render article %>
    <p>
      <%= link_to "Show this article", article %>
    </p>
  <% end %>
</div>


