require 'spec_helper'

describe "UserPages" do
  describe "Home pages" do
    it "should have the content 'Seleclothes'" do
		visit '/user_pages/home'
		expect(page).to have_content('Seleclothes')
    end
  end

  describe "About pages" do
	  it "should have the content 'About'" do
	  visit '/user_pages/about'
	  expect(page).to have_content('About')
	  end
  end

end
