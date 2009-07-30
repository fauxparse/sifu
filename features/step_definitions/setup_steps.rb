Given /^an empty (\w+) table$/ do |table_name|
  table_name.singularize.classify.constantize.destroy_all
end

Given /^I have completed setup$/ do
  Given 'an empty sites table'
  Given 'an empty users table'
  Site.configure_with(
    "users_attributes" => {
      "0" => {
        "first_name" => "Admin",
        "last_name" => "User",
        "email" => "admin@example.com",
        "login" => "admin",
        "password" => "password",
        "password_confirmation" => "password"
      }
    }
  )
  Site.should be_configured
end
