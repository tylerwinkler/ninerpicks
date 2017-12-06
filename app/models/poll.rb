class Poll < ApplicationRecord
    belongs_to :user
    has_many :responses, dependent: :destroy
    
    validates :title, presence: true, length: { minimum: 4 }
    validates :question, presence: true, length: { minimum: 6 }
end
