require "rails_helper"

feature "User creates a poll" do
    scenario "User successfully navigates to the create poll page from the all polls page" do
        
        visit polls_path
        expect(page).to have_content("All Polls")
        click_link "Create Poll"
        expect(page).to have_content("New Poll")
        expect(page).to have_field("Title")
        expect(page).to have_field("Question")
    end
    
    scenario "Blogger successfully creates a new article" do
    end
end