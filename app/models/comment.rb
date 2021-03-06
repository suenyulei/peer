class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :level, type: Integer
  field :deleted_at, type: Time
  validates :body, presence: true

  default_scope asc(:level)

  belongs_to :post
  belongs_to :author, class_name: "User"

  def author_name
    Rails.cache.fetch(["author_name_comment", self.id]) do
      author.name
    end
  end

  def hide
    self.update_attributes(deleted_at: Time.now)
  end

  before_create do
    self.level = self.post.comments.count + 1
  end
end
