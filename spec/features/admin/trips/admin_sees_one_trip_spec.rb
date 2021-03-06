require 'rails_helper'

describe 'Admin' do
  context 'visits a trip show' do
    scenario 'and it has links to edit and delete trips' do
      admin = create(:admin)
      trip  = create(:trip)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit trip_path(trip)

      expect(page).to have_link('Delete')
      expect(page).to have_link('Edit')
    end
  end
end
