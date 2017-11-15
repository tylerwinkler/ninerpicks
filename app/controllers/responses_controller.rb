class ResponsesController < ApplicationController
    def create
        @poll = Poll.find(params[:poll_id])
        @response = @poll.responses.create(response_params)
        
        redirect_to @poll
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
