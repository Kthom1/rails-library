# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  background do
    visit new_user_registration_path
  end

  scenario 'user successfully signs up', js: true do
    within('form') do
      fill_in 'First name', with: 'bob'
      fill_in 'Last name', with: 'bob'
      fill_in 'Email', with: 'bob@bob.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
    end
    click_on 'Submit'
    expect(page).to have_content('Profile')
  end

  scenario 'user fails to sign up because his password is too short', js: true do
    within('form') do
      fill_in 'First name', with: 'bob'
      fill_in 'Last name', with: 'bob'
      fill_in 'Email', with: 'bob@bob.com'
      fill_in 'Email', with: 'bob@bob.com'
      fill_in 'Password', with: '123'
      fill_in 'Password confirmation', with: '123'
    end
    click_on 'Submit'
    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end
end
