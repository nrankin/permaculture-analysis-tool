require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


feature 'home page' do
  scenario 'has a logout link' do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
    visit root_path
    expect(page).to have_link('Log Out')
  end
  scenario 'has a login link' do
    visit root_path
    expect(page).to have_button('Sign in')
  end

end