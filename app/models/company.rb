class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :number, presence: true, uniqueness: true
  validates_format_of :number, :with => /\d{10}/
end
