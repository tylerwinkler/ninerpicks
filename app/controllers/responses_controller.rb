class ResponsesController < ApplicationController
    def create
        @poll = Poll.find(params[:poll_id])
        @response = @poll.responses.create(response_params)
        
        redirect_to polls_path
    end
    
    private
    def response_params
        params.require(:response).permit(:answer)
    end
end
