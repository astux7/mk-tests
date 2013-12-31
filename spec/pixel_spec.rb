require_relative '../lib/pixel'

describe Pixel do
  let(:px) { Pixel.new(1, 2, 'C') }
  it 'should be created with color' do
    expect(px.color).to eq('C')
  end

  it 'can change the color' do
    px.color = 'D'
    expect(px.color).to eq('D')
  end

  it 'should be smart pixel knowing its coordinates' do
    expect(px.x).to eq(1)
    expect(px.y).to eq(2)
  end

end
