class Course < ActiveRecord::Base
  has_many :records
  has_many :scouts, through: :records

  has_many :preferences, dependent: :destroy
  has_many :requesting_scouts, through: :preferences, source: :scout
  
  validates :room, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :capacity, presence: true

  def has_room?(period)
    Course.where(period: period).count < capacity
  end

end
