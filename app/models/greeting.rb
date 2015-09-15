class Greeting < ActiveRecord::Base
  validates :name, presence: true
end
