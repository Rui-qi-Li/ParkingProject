# == Schema Information
#
# Table name: bookings
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  cost           :integer
#  address        :text
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  hour           :integer
#  charge_id      :string
#  charge_email   :string
#  charge_created :integer
#

class Booking < ApplicationRecord
  validates_presence_of :name, :cost, :address, :hour, :charge_email, :charge_id
  belongs_to :user
end
