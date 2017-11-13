class PollsController < ApplicationController
    def index
        @polls = Poll.all
    end
        
    def show
        @poll = Poll.find(params[:id])
    end
    
    def new
        @poll = Poll.new
    end
    
    def create
        @poll = Poll.new(poll_params)
        
        @poll.total_votes = 0;
        @poll.yes_votes = 0;
        @poll.no_votes = 0;
        
        if @poll.save
            redirect_to @poll
        else
            render 'new'
        end
    end
    
    def destroy
        @poll = Poll.find(params[:id])
        
        @poll.destroy
    end
end

private 
def poll_params
    params.require(:poll).permit(:title, :question, :author)
end