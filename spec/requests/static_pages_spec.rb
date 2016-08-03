require 'spec_helper'

describe 'Static pages' do
	
	describe 'Home page' do
		
		it "should have the content 'Sample app'" do
			visit '/static_pages/home'
			expect(page).to have_content('Sample App')
		end

		it "shoult have title with 'Home'" do
			visit '/static_pages/home'
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
		end
	end

	describe 'Help page' do
		
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')			
		end

		it "shoult have title with 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
		end
	end

	describe 'About page' do
		
		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		it "shoult have title with 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
		end
	end
end