# Load the Rails application.
require_relative 'application'

Time::DATE_FORMATS[:default] = "%d/%m/%Y %H:%M"

# Initialize the Rails application.
Rails.application.initialize!
