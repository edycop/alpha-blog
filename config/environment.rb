# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# Configuration to avoid html tags for errors in the view pages
ActionView::Base.field_error_proc = Proc.new do |html_tag, _instance|
  html_tag.html_safe
end
