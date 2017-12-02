class TrailUser < ApplicationRecord
  has_many :trails
  has_many :users
end
