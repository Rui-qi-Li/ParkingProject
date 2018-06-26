require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validation test" do
    describe "User input" do
      it "is not valid without email" do
        expect(User.new(email:nil)).to_not be_valid
      end
      it "is invalid if the password is less than 6 characters" do
        should validate_length_of(:password).is_at_least(6).on(:create)
      end
      it "is invalid without password comfirmation" do
        should validate_confirmation_of(:password)
      end
    end #describe

    describe "Email format" do
      it { should allow_value("email@addresse.foo").for(:email) }
      it { should allow_value("e''mail@addresse.foo").for(:email) }
      it { should allow_value("e''mail@addresse").for(:email) }
      it { should allow_value("e//mail@addresse.foo").for(:email) }
      it { should_not allow_value("e mail@addresse.foo").for(:email) }
    end #describe
  end #context

  context "Association test" do
    describe "User database" do
      it "has many bookings" do
        should have_many (:bookings)
      end
    end

  end # context
  # pending "add some examples to (or delete) #{__FILE__}"
end
