# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
# Nós adicionamos o FFacker aqui
require 'ffaker'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # habilita o nosso Jbuilder nos testes
  config.render_views = true
  # Nós incluimos o Factory Girl Rails aqui
  config.include FactoryGirl::Syntax::Methods
  # Aqui colocamos os Helpers do Devise para nos ajudar na hora de passar o token
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
