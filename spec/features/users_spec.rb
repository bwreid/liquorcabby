require 'spec_helper'

describe 'Users' do
  describe 'GET /' do
    it 'displays register and login buttons on the homepage' do
      visit root_path
      page.should have_link('Register')
      page.should have_link('Login')
    end
  end

  describe 'GET /' do
    it 'displays the new user form', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Cancel')
      page.should have_button('Create User')
    end
    it 'cancels the new user form', :js => true do
      visit root_path
      click_link('Register')
      page.should have_button('Cancel')
      page.should have_button('Create User')
      click_button('Cancel')
      page.should_not have_button('Cancel')
    end
  end

  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link('Register')
      fill_in('Name', :with => 'Xavier')
      fill_in('Email', :with => 'xavier@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should_not have_button('Create User')
      page.should have_text('You have successfully created an account - cheers!')
      expect(User.first.name).to eq 'Xavier'
    end
  end
end



  # describe 'POST /subscribers' do
  #   it 'creates a new subscriber', :js => true do
  #     visit root_path
  #     click_link('Register')
  #     fill_in('Name', :with => 'Bob')
  #     fill_in('Email', :with => 'bob@gmail.com')
  #     fill_in('user_password', :with => 'a')
  #     fill_in('user_password_confirmation', :with => 'a')
  #     click_button('Create User')
  #     page.should_not have_button('Create User')
  #     page.should have_text('You have successfully created an account!')
  #     expect(Subscriber.first.user.name).to eq 'Bob'
  #   end
  #    it 'does not create a new subscriber due to failing validation', :js => true do
  #     visit root_path
  #     click_link('Register')
  #     click_button('Create User')
  #     page.should have_button('Create User')
  #     page.should have_css('#form ol li', :count => 3)
  #     page.should have_text('There are 3 errors on this')
  #   end
  # end