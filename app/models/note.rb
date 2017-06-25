class Note < ApplicationRecord
  field :title, type: String
  field :content, type: String

  validates :title, :content, presence: true

  belongs_to :user
end
