require "rails_helper"

feature "User can respond to polls" do
    scenario "User takes their poll" do
        visit '/polls/1'
        expect(page).to have_content("Question: This is a test question")
        click_link "Take Poll"
        
        expect(page).to have_content("True")
        
        choose("response_answer_true")
        
        click_button "Create Response"
        
        visit '/polls/1/responses'

        page.should have_content('True')
    end
end