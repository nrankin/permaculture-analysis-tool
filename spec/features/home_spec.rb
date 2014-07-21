require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!


feature 'home page' do
  context 'when a user is logged in ' do
    before(:each) do
      @user = FactoryGirl.create(:user)
      login_as(@user, :scope => :user)
    end
    scenario 'it has a logout link' do
      visit root_path
      expect(page).to have_link('Log Out')
    end
    scenario 'it has a link to edit profile' do
       visit root_path
      expect(page).to have_link('Edit profile')
    end
  end
  context 'when a user is not logged in' do
    scenario 'it has a login link' do
      visit root_path
      expect(page).to have_button('Sign in')
    end
  end

end