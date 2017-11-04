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
        @poll = Poll.new
        
        @poll.save
    end
    
    def destroy
        @poll = Poll.find(params[:id])
        
        @poll.destroy
    end
end
