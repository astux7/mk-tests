require_relative '../lib/pixel'

describe Pixel do
  let(:px) { Pixel.new(1, 2, 'C') }

	it 'should be created' do
		expect(px.color).to eq('C')
	end

  it 'can change the color' do
    px.color = 'D'
    expect(px.color).to eq('D')
  end

  it 'can raise the error if the color does not exist' do
    expect(lambda { px.color = 4 }).to raise_error(RuntimeError)
  end

  it 'should be smart pixel knowing its coordinates' do
    expect(px.x).to eq(1)
    expect(px.y).to eq(2)
  end

  it 'should handle the error of coordinates' do
     expect(lambda { Pixel.new('M',300,'M')}).to raise_error(RuntimeError)
  end
  
  it 'should handle the error of color' do
     expect(lambda { Pixel.new(-4, 5, 'i')}).to raise_error(RuntimeError)
  end

  it 'should handle the error of init empty pixel' do
     expect(lambda { Pixel.new}).to raise_error(RuntimeError)
  end

  it 'should handle the error of init 1 argument of pixel' do
     expect(lambda { Pixel.new(0)}).to raise_error(RuntimeError)
  end
end