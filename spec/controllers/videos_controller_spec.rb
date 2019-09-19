require 'rails_helper'

RSpec.describe VideosController, type: :controller do

  describe "GET #index" do
    before do 
      allow(Video).to receive(:all).and_return([])
    end
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(Video).to have_received(:all)
    end
  end
  
  describe "GET #show" do
    before do 
      allow(Video).to receive(:get).and_return({})
    end
    
    it "returns http success" do
      get :show, params: { id: 'video-id' }
      expect(response).to have_http_status(:success)
      expect(Video).to have_received(:get)
    end
  end

end
