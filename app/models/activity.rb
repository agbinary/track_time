class Activity < ActiveRecord::Base
  enum status: [:open, :close]
  enum track_type: [:timer, :manual]

  validates :start_time, :date_report, :status, :track_type, :user_id, presence: true

  belongs_to :user
  belongs_to :project

  validate :end_time_greater_than_start_time, on: [:create, :update]

  def calculate_total_time
    end_time - start_time
  end

  def show_start_time
    if self.timer?
      return start_time.localtime.strftime("%H:%M")
    else
      return start_time.strftime("%H:%M")
    end
  end

  def show_end_time
    if self.timer?
      return end_time.localtime.strftime("%H:%M")
    else
      return end_time.strftime("%H:%M")
    end
  end

  private

  def end_time_greater_than_start_time
    if start_time != nil && end_time != nil
      if start_time > end_time
        errors.add(:end_time, 'must be greater than the start time')
      end
    end
  end
end
