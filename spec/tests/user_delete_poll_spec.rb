require "rails_helper"

feature "User can delete their own polls" do
    scenario "User deletes their poll" do
        visit '/polls/2'
        expect(page).to have_content("testing")
        click_link "Delete Poll"

        page.should have_no_content('This is a test poll')
    end
end