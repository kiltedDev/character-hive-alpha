require 'spec_helper'

feature 'user signs out', %Q{
  As a user
  I want to be able to sign out
} do

  scenario 'an existing user specifies a valid email and password' do
    greg = FactoryGirl.create(:user)
    login_as(greg, :scope => :user)

    visit root_path
    click_link 'Sign Out'

    # expect(page).to have_content("Signed out successfully.")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
  end
end
