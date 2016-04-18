require 'rails_helper'

RSpec.feature "Stories", type: :feature do
  scenario "test" do
    visit "/"

    fill_in "search for stations", with: 80203
    VCR.use_cassettes("cassette.name") do
      click_on "Locate"
      expect(current_path).to eq(search_path)
      within "div#results" do
        expect(page).to have_css("div#location-1")
        expect(page).to have_css("div#location-10")
      end
    end
  end
end

# ```
# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search?zip=80203"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
# ​
# When I visit "/"
# And I fill in the search form with 80203
# And I enter "5" into an optional "Distance" field
# And I click "Locate"
# Then I should see a list of the 10 closest stations within 5 miles sorted by distance
# And the results should share the same format as above
# And I should see about 6 pagination links at the bottom of the results (As of the writing of this story there are 51 results. Number of links should be RESULTS divided by 10)
# ​
# When I click the "2" link
# Then I should be on page "/search?zip=80203&page=2"
# And I should see the next 10 results following the same format as above
# And I should see a next and back link
# ​
# When I click the next link
# Then I should be on page "/search?zip=80203&page=3"
# And I should see the next 10 results following the same format as above
# ​
# When I click the back link
# Then I should be on page "/search?zip=80203&page=2"
# And I should see the previous 10 results following the same format as above
# ```
