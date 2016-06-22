class Article < ActiveRecord::Base
	validates :title, presence: true
	validates :body, presence: true
	belongs_to :user
	has_many :comments

	default_scope { order(created_at: :desc) }
end
