class Post < ApplicationRecord
	searchkick word_start: [:title]

	extend FriendlyId
		friendly_id :title, use: :slugged
end
