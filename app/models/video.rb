class Video < ActiveRecord::Base
  acts_as_votable
  is_impressionable
has_many :comments, dependent: :destroy
belongs_to :user

def self.search(search)
  # I see you have the model method here, but this is not being used
  # in your videos controller.
  where("LOWER(subject) LIKE ?", "%#{search.downcase}%")
  # where("content LIKE ?", "%#{search}%")
end

end
