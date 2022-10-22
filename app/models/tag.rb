class Tag < ApplicationRecord
  has_many :training_tag_relations, dependent: :destroy
  has_many :training_posts, through: :training_tag_relations, dependent: :destroy
end
