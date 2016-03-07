require "rails_helper"

feature "User searches for 'clas ohlson'" do
  scenario "They fill in the search form" do
    visit "/"

    fill_in "q", with: "clas ohlson"
    click_button "Search"

    expect(page).to have_content("8024311535")
  end
end
