class PollController < ApplicationController
    def new
        @poll = Poll.new
    end
    
    def create
        @poll = Poll.new
        
        if @poll.save
            redirect_to @poll
        else
            render 'new'
        end
    end
    
    def show
        @poll = Poll.find(params[:id])
    end
    
    def index
        @polls = Poll.all
    end
end

private 
def article_params
    params.require(:poll).permit(:title, :text)
end
