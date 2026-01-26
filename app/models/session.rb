class Session < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true
  validates :agent, presence: true

  has_many_attached :screenshots

  AGENTS = [ "Opencode", "Claude", "Cursor" ]
end
