
require_relative '../lib/mairie_christmas.rb'

describe 'mairie_christmas fonction' do
  it 'Mairie should display an array whitout nil' do
    expect(emails_hashing.is_a?(Array)).to eq true
    expect(emails_hashing.all? { |elem| elem.class == Hash }).to be true
  end
  it 'Mairie has a least few city' do
    expect(emails_hashing[0].key?('ABLEIGES')).to eq true
    expect(emails_hashing[1].key?('AINCOURT')).to eq true
  end
end