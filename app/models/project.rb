class Project < ActiveRecord::Base
  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :activities, dependent: :destroy

  def total_time_project
    activities.sum(:total_time)
  end
end
