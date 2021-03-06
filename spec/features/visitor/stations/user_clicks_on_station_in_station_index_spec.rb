require 'rails_helper'

describe 'visitor' do
  scenario 'sees all stations on stations index' do
    stations = create_list(:station, 3)

    visit stations_path

    stations.each do |station|
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date.strftime("%B %d, %Y"))
    end

    click_on "#{stations.first.name}"

    expect(current_path).to eq("/stations/#{stations.first.slug}")
  end
end
