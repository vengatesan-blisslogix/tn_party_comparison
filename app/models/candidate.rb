class Candidate < ActiveRecord::Base
	belongs_to :party_list
	belongs_to :area
	has_many :votes
	has_attached_file :avatar,
                   styles: {
                     medium: '300x300>',
                     thumb: '100x100>'
                   }                    

 validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
 validates_with AttachmentSizeValidator, attributes: :avatar,
                                         less_than: 2.megabytes
end
