class Blog < ApplicationRecord

  has_many :schedules, dependent: :destroy

  belongs_to :user

end
