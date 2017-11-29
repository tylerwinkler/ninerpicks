class PollsController < ApplicationController
    def index
        @table_title = "All Polls"
        @polls = Poll.all.reverse
    end
        
    def show
        @poll = Poll.find(params[:id])
    end
    
    def new
        if !user_signed_in?
            redirect_to '/users/sign_in', 
            notice: 'You must be logged in to create a poll'
            return
        end
        
        @user = current_user
        
        @poll = Poll.new
    end
    
    def create
        # The user should already be signed in but this is to make sure they
        # arent trying anything funny
        if !user_signed_in?
            redirect_to '/users/sign_in', 
            notice: 'You must be logged in to create a poll'
            return
        end
        
        @poll = Poll.new(poll_params)
        
        @poll.author = current_user.email
        
        if @poll.save
            redirect_to polls_path
        else
            render 'new'
        end
    end
    
    def edit
        @poll = Poll.find(params[:id])
    end
    
    def featured
        @table_title = "Featured Polls"
        @polls = Poll.all.sample(5)
    end
    
    def take
        if !user_signed_in?
            redirect_to '/users/sign_in', 
            notice: 'You must be logged in to respond to a poll'
            
            return
        end
        
        @poll = Poll.find(params[:id])
        
        @yes_choice = @poll.answer_style == false ? 'True' : 'Yes'
        @no_choice = @poll.answer_style == false ? 'False' : 'No'
        
        if @poll.author == current_user.email
            @poll.errors.add :base, "You can not take your own poll"
            render 'polls/show'
        end
    end
    
    def update
        if !user_signed_in?
            redirect_to '/users/sign_in', 
            notice: 'You must be logged in to edit a poll'
            return
        end
        
        @poll = Poll.find(params[:id])
        
        # Only the author of a poll can edit a poll
        if @poll.author != current_user.email
            @poll.error.add :base, "You can only edit your own polls"
            render 'polls/show'
        end
        
        # The poll must have 0 responses to be edited
        if @poll.responses.count != 0
            return
        end
        
        if @poll.update(article_params)
            redirect_to @poll
        else
            render 'edit'
        end
    end
    
    def destroy
        if !user_signed_in?
            return
        end
        
        @poll = Poll.find(params[:id])
        
        # Only the author of a poll can delete a poll
        if @poll.author != current_user.email
            @poll.errors.add :base, "You can only delete your own polls"
            render 'polls/show'
            return
        end
        
        @poll.destroy
        
        redirect_to polls_path
    end
end

private 
def poll_params
    params.require(:poll).permit(:title, :question, :answer_style)
end