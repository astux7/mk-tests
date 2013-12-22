require_relative '../lib/image'

describe Image do
  let(:img){Image.new(4,5)}
  it 'should create an image' do
     expect(img.pixels_count).to eq(20)
  end
  it 'should raise the error if the MxN out of range 1..250' do 
    expect(lambda { Image.new(251,6,'O')}).to raise_error(RuntimeError)
  end
  it 'should clear the image' do
    img.clear
    expect(img.pixels[1][2].color).to eq('C')
  end
  it 'should draw the image as created' do
    expect(img).to receive(:print).with("OOOOO\\nOOOOO\\nOOOOO\\nOOOOO")
    img.inspect
  end
  it 'should draw the image after cleaning' do
    img.clear
    expect(img).to receive(:print).with("CCCCC\\nCCCCC\\nCCCCC\\nCCCCC")
    img.inspect
  end
end	