class Post < ApplicationRecord
	searchkick batch_size: 50, index_prefix: "featured"

	extend FriendlyId
		friendly_id :title, use: :slugged
end
