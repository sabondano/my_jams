require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test "logged in admin sees a category index" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_users_path
    
    assert page.has_content?("All Users")
  end

  test "default user cannot see category index" do
    user = User.create(username: "default_user",
                        password: "asdf",
                        role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_users_path
    
    refute page.has_content?("All Users")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end

end
