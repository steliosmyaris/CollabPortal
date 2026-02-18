class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, :category, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category", "content", "created_at", "id", "title", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end
end