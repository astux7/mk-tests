require_relative '../lib/image'

describe Image do
  let(:img){Image.new(2,3,'O')}
  it 'should create an image' do
     expect(img.pixels.count).to eq(6)
  end
  it 'should raise the error if the MxN out of range 1..250' do 
    expect(lambda { Image.new(251,6,'0')}).to raise_error(RuntimeError)
  end
end	