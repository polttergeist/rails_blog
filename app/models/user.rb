class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
end

# h = {}
# User.all.each do |u|
#   h[u.id] = []
#   u.articles.each do |a|
#     h[u.id].append(a.title)
#   end
#   h[u.id] = nil if h[u.id] == []
# end
