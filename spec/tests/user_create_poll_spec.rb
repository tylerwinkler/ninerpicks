require "rails_helper"

feature "User creates a poll" do
    scenario "User successfully navigates to the create poll page from the all polls page" do
        visit polls_path
        expect(page).to have_content("All Polls")
        click_link "Create Poll"
        
        expect(page).to have_content("Question")
    end
    
    scenario "User can create a poll" do
        visit new_poll_path
        fill_in('Question', :with => 'This is a test question')

        click_button("Create Poll")
       
        expect(page).to have_content("This is a test question")
    end
end