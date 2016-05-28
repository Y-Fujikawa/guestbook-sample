class Greeting < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validate  :image_valid?, :if => Proc.new{ |greeting| greeting.image_changed? && greeting.errors[:image].blank? }

  def image_valid?
    white_list_content_types = ["image/jpg", "image/jpeg", "image/png", "image/x-citrix-png", "image/x-citrix-jpeg", "image/x-png", "image/pjpeg"]
    unless white_list_content_types.include?(image.file.content_type)
      errors.add(:image, I18n.t("activerecord.errors.models.greeting.attributes.image.illegal_file_attachment"))
    end
  end

  validates :name, presence: true
end
