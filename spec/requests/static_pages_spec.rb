require 'spec_helper'

describe 'Static pages' do

	base_title = "Ruby on Rails Tutorial Sample App"
	
	describe 'Home page' do
		
		it "should have the content 'Sample app'" do
			visit root_path
			expect(page).to have_content('Sample App')
		end

		it "shoult have base title" do
			visit root_path
			expect(page).to have_title("#{base_title}")
		end

		it "should not have custom title" do
			visit root_path
			expect(page).not_to have_title("| Home")
		end
	end

	describe 'Help page' do
		
		it "should have the content 'Help'" do
			visit help_path
			expect(page).to have_content('Help')			
		end

		it "shoult have title with 'Help'" do
			visit help_path
			expect(page).to have_title("#{base_title} | Help")
		end
	end

	describe 'About page' do
		
		it "should have the content 'About Us'" do
			visit about_path
			expect(page).to have_content('About Us')
		end

		it "shoult have title with 'About'" do
			visit about_path
			expect(page).to have_title("#{base_title} | About")
		end
	end

	describe 'Contact page' do
		
		it "it should have the content ''" do
			visit contact_path
			expect(page).to have_content('Contact')
		end

		it "should have title with 'Content'" do
			visit contact_path
			expect(page).to have_title("#{base_title} | Contact")
		end
	end
end