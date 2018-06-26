require 'rails_helper'

RSpec.describe ParkingsController, type: :controller do
  describe 'GET /' do
    it "return the welcome root page" do
       get :welcome
       expect(response).to be_success
    end
  end # describe

  describe 'GET #index #booking' do

    it "return the search result list page" do
      user = create(:user)
      sign_in user
      get :index, params:{ search: {
        address:'Palmerstown, Johnstown, Co. Kildare, Ireland',
        lat: '53.2370579',
        lng: '-6.621797499999957'
        }
      }
      expect(response).to be_success
    end
    it "return booking record" do
      user = create(:user)
      sign_in user
      get :booking
      expect(response).to be_success
    end
  end # describe

end
