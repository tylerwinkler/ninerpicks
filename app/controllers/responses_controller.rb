class ResponsesController < ApplicationController
    
    def new
        @poll = Poll.find(params[:poll_id])

        @response = @poll.responses.new
    end
    
    def create
        @poll = Poll.find(params[:poll_id])

        @response = @poll.responses.new(response_params)
        
        if (@response.save)
            redirect_to @poll
        else
            # I cant get this to return back to the take screen and display an
            # error message to the user saying that their response was not saved
            redirect_to @poll
            return
        end
    end
        
    def index
        @poll = Poll.find(params[:poll_id])
        @responses = @poll.responses
    end
    
    def show
        @response = Response.find(params[:id])
    end
    
    private
    def response_params
        params.require(:response).permit(:answer)
    end
end
