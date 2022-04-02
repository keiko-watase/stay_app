class Resavation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :people_number, presence: true, numericality: true
  validate :start_end_check
  validate :date_before_start

  def start_end_check
    errors.add(:end_at, "は開始日以降の日を登録してください") unless
    start_at == nil || end_at == nil || start_at < end_at
  end
  
  def date_before_start
    errors.add(:start_at, "は今日以降のものを選択してください") if
    start_at != nil && end_at != nil && start_at < Date.today
  end
end
