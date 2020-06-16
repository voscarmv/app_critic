require 'rails_helper'

RSpec.describe 'User session actions', type: :feature do
  before :each do
    User.create(username: 'oscar', email: 'oscar@mail.com', fullname: 'Oscar Mier', password: '123456')
  end

  scenario 'creating a user' do
    visit new_user_registration_path
    fill_in 'Email', with: 'alexis@mail.com'
    fill_in 'Username', with: 'alexis'
    fill_in 'user_fullname', with: 'Alexis Sanchez'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'creating a user with duplicate username' do
    visit new_user_registration_path
    fill_in 'Username', with: 'oscar'
    fill_in 'user_fullname', with: 'Oscar Mier'
    fill_in 'Email', with: 'a2@mail.com'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
    expect(page).to have_content('Username has already been taken')
  end

  scenario 'creating a user with duplicate email' do
    visit new_user_registration_path
    fill_in 'Username', with: 'Oscar2'
    fill_in 'user_fullname', with: 'Oscar Mier'
    fill_in 'Email', with: 'oscar@mail.com'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end

  scenario 'user logs in successfully' do
    visit user_session_path
    fill_in 'Email', with: 'oscar@mail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'User fails trying to log in' do
    visit user_session_path
    fill_in 'Email', with: 'a@mail.com'
    fill_in 'Password', with: '123123'
    click_on 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'user logs out' do
    visit user_session_path
    fill_in 'Email', with: 'oscar@mail.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    find("a[href='#{destroy_user_session_path}']").click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
