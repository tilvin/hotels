require "rails_helper"

RSpec.describe Inn, type: :model do

  it 'create_rooms' do
    @inn = create(:inn, room_count: 5, name: 'alpha')
    expect(@inn.rooms.count).to eq(@inn.room_count)
  end
end
