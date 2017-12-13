require "rails_helper"

feature "User can delete their own polls" do
    scenario "User deletes their poll" do
        visit '/polls/1'
        expect(page).to have_content("Question: This is a test question")
        click_link "Delete Poll"

        page.should have_no_content('This is a test question')
    end
end