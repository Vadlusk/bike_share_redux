require 'rails_helper'

describe 'visitor' do
  scenario 'visitor sees all station attribute' do
    station = create(:station)
    trips   = create_list(:trip, 10, start_station_id: station.id, end_station_id: station.id)
    visit station_path(station)

    expect(page).to have_content(station.name)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.lat)
    expect(page).to have_content(station.long)
    expect(page).to have_content(station.installation_date.strftime("%B %d, %Y"))
  end

  scenario 'visitor sees station name in URL' do
    station = create(:station)
    trips   = create_list(:trip, 10, start_station_id: station.id, end_station_id: station.id)
    visit station_path(station)

    expect(current_path).to eq("/stations/#{station.slug}")
    expect(page).to have_content(station.name)
    expect(page).to have_content(station.dock_count)
    expect(page).to have_content(station.city)
    expect(page).to have_content(station.installation_date.strftime("%B %d, %Y"))
  end
end
