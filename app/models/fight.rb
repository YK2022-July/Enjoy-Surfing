class Fight < ApplicationRecord
  belongs_to :end_user
  belongs_to :training_post
end
