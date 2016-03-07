require "rails_helper"

feature "User searches for non-existent company" do
  scenario "They fill in the search form" do
    visit "/"

    fill_in "q", with: "EjExisterande AB"
    click_button "Search"

    expect(page).to have_content("Company not found")
  end
end
