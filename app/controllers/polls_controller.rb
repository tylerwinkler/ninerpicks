class PollsController < ApplicationController
    def index
        @polls = Polls.all
    end
    
    def new
        @poll = Poll.new
    end
end
