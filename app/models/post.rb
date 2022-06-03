class Post < ApplicationRecord

    extend FriendlyId
    friendly_id :slug, use: :slugged
end
