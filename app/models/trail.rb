class Trail < ApplicationRecord
  has_many :trail_users
  has_many :users, through :trail_users
end
