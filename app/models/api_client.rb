class APIClient < ApplicationRecord
  validates :token, presence: true
end
