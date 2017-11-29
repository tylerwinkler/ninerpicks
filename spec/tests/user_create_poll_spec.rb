require "rails_helper"

feature "User creates a poll" do
    scenario "User successfully navigates to the create poll page from the all polls page" do
        visit polls_path
        expect(page).to have_content("All Polls")
        click_link "Create Poll"

        expect(page).to have_content("Title")
        expect(page).to have_content("Question")
    end
    
    scenario "User can create a poll" do
        visit polls_path
        click_link "Create Poll"
        
        fill_in('Title', :with => 'This is a test poll')
        fill_in('Question', :with => 'This is a test question')
        click_button("Create Poll")
        
        expect(page).to have_content("This is a test poll")
    end
end