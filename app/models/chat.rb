class Chat < ApplicationRecord
  belongs_to :favorite
  has_many :messages, dependent: :destroy
  has_one :dog, through: :favorite
  has_one :shelter, through: :dog, source: :user # The shelter user (through Dog.user_id)
  has_one :searcher, through: :favorite, source: :user # The searcher user (directly from Favorite.user_id)

  validate :unique_chat_per_user_and_favorite, on: :create

  private

  def unique_chat_per_user_and_favorite
    user_id = favorite.user_id

    if Chat.joins(:favorite)
            .where(favorites: { user_id: user_id }, favorite_id:)
            .exists?
      errors.add(:base, "User already has a chat for this favorite")
    end
  end
end
