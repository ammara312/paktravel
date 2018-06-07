class Comment < ApplicationRecord
	# in rails 5 they are not needed anymore because when we say belongs to user it automatically done this
  #validates :user, presence: :true
  #validates :product, presence: :true

  validates :body, presence: true
  validates :rating, numericality: { only_integer: true }

  after_create_commit { CommentUpdateJob.perform_later(self, self.user) }

  belongs_to :user
  belongs_to :product


  # for desending order means the highest rating at the top
  scope :rating_desc, -> { order(rating: :desc) }

  # for ascending order, lowest at the top...
  scope :rating_asc, -> { order(rating: :asc) }
end
