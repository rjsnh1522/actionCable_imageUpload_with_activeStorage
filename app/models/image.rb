class Image < ApplicationRecord
	belongs_to :user
	after_create_commit { ImageBroadCastJob.perform_later(self) }
	has_one_attached :photo
	validate :main_picture_format
	private

	def main_picture_format
	  return unless photo.attached?
	  return if photo.blob.content_type.start_with? 'image/'
	  photo.purge_later
	  errors.add(:photo, 'needs to be an image')
	end
end
