class Poll < ApplicationRecord
    has_many :questions
    validates :title, presence: true, length: { minimum: 4 }
    validates :author, presence: true, length: { minimum: 3 }
end
