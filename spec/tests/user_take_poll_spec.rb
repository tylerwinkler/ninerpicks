require "rails_helper"

feature "User can respond to polls" do
    scenario "User takes their poll" do
        visit '/polls/2'
        expect(page).to have_content("testing")
        click_link "Take Poll"
        
        expect(page).to have_content("True")
        
        choose("response_answer_true")
        
        click_button "Create Response"
        
        visit '/polls/2/responses'

        page.should have_content('True')
    end
end