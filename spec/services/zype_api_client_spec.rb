require 'rails_helper'

RSpec.describe ZypeApi::Client do
  subject { described_class.new }

  let(:video) do
    {
      _id: "56a7b83069702d2f8309d9b7"
    }
  end

  let(:video_response) do
    {
      response: video
    }
  end
  
  let(:videos_response) do
    {
      response: [video]
    }
  end
  
  before do
    allow(ZypeApi::Client).to receive(:get).with('', any_args).and_return(videos_response.to_json)
    allow(ZypeApi::Client).to receive(:get).with('/1', any_args).and_return(video_response.to_json)
  end

  describe '#get_all' do
    it 'calls the API to get the list of videos' do
      expect(subject.get_all).to eq videos_response[:response]
    end
  end
  
  describe '#get' do
    it 'calls the API to get one video' do
      expect(subject.get(1)).to eq video_response[:response]
    end
  end

  describe '#app_key' do
    it 'returns an app_key' do
      expect(subject.app_key).to be_a(String)
    end
  end
end
