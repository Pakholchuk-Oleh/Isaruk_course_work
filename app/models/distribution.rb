# == Schema Information
#
# Table name: distributions
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Distribution < ApplicationRecord
  has_many :codes, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
end
