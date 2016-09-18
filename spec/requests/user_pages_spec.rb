require 'spec_helper'

describe 'User pages' do
	
	subject { page }

	describe 'signup page' do
		before { visit signup_path }

		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }

		describe 'send user data' do
			let(:submit) { lambda { click_button "Create my account" } }

			describe 'with invalid information' do
				it "should not create a user" do
					expect( &submit ).not_to change(User, :count)
				end

				describe 'after submission' do
					before { click_button 'Create my account' }

					it { should have_title 'Sign up' }
					it { should have_content 'error' }
				end
			end

			describe 'with correct information' do
				before do
					fill_in "Name", 				with: "Example User"
					fill_in "Email", 				with: "user@example.com"
					fill_in "Password", 		with: 'foobar'
					fill_in "Confirmation", with: 'foobar'
				end

				it "should create a user" do
					expect( &submit ).to change(User, :count).by(1)
				end

				describe 'signed in after saving the user' do
					before { click_button 'Create my account' }
					let(:user) { User.find_by email: 'user@example.com' }

					it { should have_link 'Sign out' }
					it { should have_title user.name }
					it { should have_selector 'div.alert.alert-success', text: 'Welcome' }
				end  

			end
		end
	end

	describe 'profile page' do
		let(:user) { FactoryGirl.create :user }
		before { visit user_path user }

		it { should have_content user.name }
		it { should have_title user.name }
	end

end