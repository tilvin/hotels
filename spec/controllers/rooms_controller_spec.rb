require "rails_helper"

RSpec.describe RoomsController, type: :controller do

  before do
    @user = create(:admin)
    login_user
  end

  it "GET #show" do
    inn = create(:inn)
    room = create(:room, inn: inn)
    get :show, params: { inn_id: inn.id, id: room.id }
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end
end