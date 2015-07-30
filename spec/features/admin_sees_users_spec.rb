require 'rails_helper'

feature "admin sees users index" do
  scenario "when logged in as admin" do
    admin = User.create(username: "admin",
                        password: "asdf",
                        role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_users_path

    expect(page).to have_content("All Users")
  end

  scenario "but cant if logged in as default user" do
    user = User.create(username: "default_user",
                       password: "asdf",
                       role: 0)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit admin_users_path

    expect(page).to_not have_content("All Users")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
