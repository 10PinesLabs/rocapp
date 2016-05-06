require 'rails_helper'

describe 'Token Service' do
  let(:service) { TokenService.new }

  it 'should encode a string into a different one than the original payload' do
    original_data = 'data'
    encoded = service.encode original_data

    expect(encoded).not_to eq original_data
    end

  it 'should decode to the original payload' do
    original_data = 'data'
    encoded = service.encode original_data

    decoded = service.decode encoded

    expect(decoded).not_to eq original_data
  end

end