require "rails_helper"

feature "User just clicks search button" do
  scenario "They don't fill in the search form" do
    visit "/"
    click_button "Search"

    expect(page).to have_content("Company not found")
  end
end
