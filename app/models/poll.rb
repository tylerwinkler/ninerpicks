class Poll < ApplicationRecord
    has_many :responses, dependent: :destroy
    
    validates :title, presence: true, length: { minimum: 4 }
    validates :author, presence: true, length: { minimum: 3 }
    paginates_per 5
end
