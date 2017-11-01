class PollsController < ApplicationController
    def index
        @polls = Poll.all
    end
        
    def show
        
    end
    
    def new
    end
    
    def create
    end
end
