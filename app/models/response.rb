class Response < ApplicationRecord
    belongs_to :poll
    belongs_to :user
    
    validate :validate
  
    def validate
        @poll = Poll.find(self.poll_id)
        @permitted_values = Array.new;
        
        if @poll.answer_style == false
            @permitted_values.push 'True', 'False'
        elsif @poll.answer_style == true
            @permitted_values.push 'Yes', 'No'
        end
        
        if !@permitted_values.include? self.answer
            self.errors.add :base, 'Error'
        end
    end
end
