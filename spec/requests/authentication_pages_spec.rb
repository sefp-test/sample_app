require 'spec_helper'

describe 'Authentication' do
	
	subject { page }

	describe 'signin page' do
		before { visit signin_path }

		it { should have_content 'Sign in' }
		it { should have_title 'Sign in' }
	end

	describe 'signin' do
		let(:signin_button) { 'Sign in' }
		let(:error_message) { 'div.alert.alert-error' }
		before { visit signin_path }

		describe 'with invalid information' do
			before { click_button signin_button }

			it { should have_title 'Sign in' }
			it { should have_selector error_message }

			describe 'after visiting anther page' do
				before { click_link 'Home' }
				it { should_not have_selector error_message }
			end
		end  

		describe 'with valid information' do
			let(:user) { FactoryGirl.create :user }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button signin_button
			end

			it { should have_title user.name }
			it { should have_link 		'Profile',	href: user_path(user) }
			it { should have_link 		'Sign out', href: signout_path }
			it { should_not have_link 'Sign in',	href: signin_path }

			describe 'followed by signout' do
				before { click_link 'Sign out' }
				it { should have_link 'Sign in' }
			end
		end
	end
end