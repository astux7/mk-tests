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
    expect(img.pixels[2].color).to eq('C')
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
  it 'should color the pixel[2,4] in image with color T' do
    img.color_the_pixel(2,4,'T')
    expect(img).to receive(:print).with("OOOOO\\nOOOTO\\nOOOOO\\nOOOOO")
    img.inspect
  end
  it 'should color the line of pixels [2,3][2,4][2,5] color M' do
    coord = [[2,3],[2,4],[2,5]]
    img.draws_image_lines(coord,'M')
    expect(img).to receive(:print).with("OOOOO\\nOOMMM\\nOOOOO\\nOOOOO")
    img.inspect
  end
  it 'should color the line of pixels [1,3][2,3][3,3] color M' do
    coord = [[1,3],[2,3],[3,3]]
    img.draws_image_lines(coord,'M')
    expect(img).to receive(:print).with("OOMOO\\nOOMOO\\nOOMOO\\nOOOOO")
    img.inspect
  end
end	