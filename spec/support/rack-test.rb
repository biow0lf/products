# https://github.com/jnicklas/capybara/commit/0188693ced2fe3362e9433b20f49b4dbc7a0fdcd
Capybara.register_driver :rack_test do |app|
  Capybara::RackTest::Driver.new(app, respect_data_method: false)
end
