class Vote < ActiveRecord::Base
	belongs_to :candidate
	belongs_to :party_list
end
