class Signup < ApplicationRecord
    belongs_to :camper
    belongs_to :activity

    validates :time, inclusion: 0..23
    validates_presence_of :camper_id, :activity_id
end
