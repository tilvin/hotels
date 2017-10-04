require "rails_helper"

RSpec.describe InnsController, type: :controller do

  before do
    @inn = create(:inn)
    @user = create(:admin)
    login_user
  end

  it "GET #index" do
    get :index
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "GET #show" do
    get :show, params: { id: @inn.id }
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "GET #new" do
    get :new
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  describe "POST create" do

    it "change count" do
      post :create, params: { inn: attributes_for(:inn) }
      expect(Inn.count).to eq(2)
    end

    it 'render index template' do
      post :create, params: { inn: attributes_for(:inn) }
      expect(response).to redirect_to(inn_path(Inn.last))
    end
  end

  it "GET #edit" do
    get :edit, params: { id: @inn.id }
    expect(response).to be_success
    expect(response).to have_http_status(200)
  end

  it "#update" do
    put :update, params: { id: @inn.id, inn: { name: 'Дельта' } }
    expect(@inn.reload.name).to eq('Дельта')
  end

  it "#destroy" do
    delete :destroy, params: { id: @inn.id }
    expect(response).to redirect_to(inns_path)
    expect(Inn.count).to eq(0)
  end
end
