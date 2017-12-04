require "rails_helper"


feature "User can view polls" do
    scenario "User is able to see a list of all polls" do
        visit polls_path
        
        expect(page).to have_content ("All Polls")
        expect(page).to have_content ("View Featured Polls")
        
        expect(page).to have_content("test")
    end
    
    scenario "User is able to see a list of featured polls" do
        visit '/polls/featured'
        
        expect(page).to have_content ("Featured Polls")
        expect(page).to have_content ("View All Polls")
    end
    
    scenario "User is able to select and view an individual poll" do
        visit '/polls/2'
        
        expect(page).to have_content "Take Poll"
        expect(page).to have_content "Delete Poll"
    end
end