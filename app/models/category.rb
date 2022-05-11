# == Schema Information
#
# Table name: categories
#
#  id              :bigint           not null, primary key
#  description     :text
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  distribution_id :bigint           not null
#
# Indexes
#
#  index_categories_on_distribution_id  (distribution_id)
#
# Foreign Keys
#
#  fk_rails_...  (distribution_id => distributions.id)
#
class Category < ApplicationRecord
  belongs_to :distribution

  validates :name, :description, presence: true
end
