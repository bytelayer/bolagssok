require "rails_helper"

feature "User searches for ApoEx AB" do
  scenario "They fill in the search form" do
    visit "/"

    fill_in "q", with: "ApoEx AB"
    click_button "Search"

    expect(page).to have_content("5566334149")
  end
end
