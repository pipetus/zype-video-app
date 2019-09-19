require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { described_class }

  let(:zype_api) { double('ZypeApi', get_all: [], get: {}) }

  before do
    allow(::ZypeApi::Client).to receive(:new).and_return(zype_api)
  end

  describe '.all' do
    it 'calls the API to get the list of videos' do
      expect(subject.all).to eq []
      expect(zype_api).to have_received(:get_all)
    end
  end
  
  describe '.get' do
    it 'calls the API to get one video' do
      expect(subject.get(1)).to be_a(Video)
      expect(zype_api).to have_received(:get)
    end
  end
end
