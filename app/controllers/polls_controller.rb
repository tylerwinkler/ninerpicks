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
            redirect_to '/users/sign_in', notice: 'You must be logged in to create a poll'
            return
        end
        
        @user = current_user
        
        @poll = Poll.new
    end
    
    def create
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
        @poll = Poll.find(params[:id])
        if @poll.author == current_user.email
            redirect_to polls_path
        end
    end
    
    def update
        @poll = Poll.find(params[:id])
        
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
        
        @poll.destroy
        
        redirect_to polls_path
    end
end

private 
def poll_params
    params.require(:poll).permit(:title, :question, :author)
end