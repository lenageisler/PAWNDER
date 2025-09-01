class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, presence: true, inclusion: { in: ["shelter", "searcher"] }

  validates :username, presence: true, if: -> { role == "searcher" }
  validates :name, :type, :location, presence: true, if: -> { role == "shelter" }

#  has_many :dogs (if role is shelter)
#  has_one :preference (if role is searcher)
#  has_many :favorites (if role is searcher)
#  has_many :dogs, through: :favorites (if role is searcher)
#  has_many :ai_chats (if role is searcher)

#  connection to chats?! through favorites for searchers, through favorites and dogs for shelters
end
