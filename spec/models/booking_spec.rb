require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe "association test" do
    it "booking database" do
      should belong_to (:user)
    end
  end
  # pending "add some examples to (or delete) #{__FILE__}"
end
