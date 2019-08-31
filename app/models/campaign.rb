class Campaign < ApplicationRecord
	validates :title, :summary, :body, presence: true
end
