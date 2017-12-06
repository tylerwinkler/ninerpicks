class Poll < ApplicationRecord
    belongs_to :user
    has_many :responses, dependent: :destroy

    validates :question, presence: true, length: { minimum: 6 }
end
