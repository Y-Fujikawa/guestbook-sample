class Greeting < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :name, presence: true
end
