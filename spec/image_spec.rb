require_relative '../lib/image'

describe Image do
  let(:img) { Image.new }

  #before(:all) do   end
  
  it 'should create an image' do
    img.create_image(5, 4, 'O')
    expect(img.pixels_count).to eq(20)
  end
  it 'should raise the error if the MxN out of range 1..250' do 
    img1 = Image.new
    expect(lambda { img1.create_image(300,200)}).to raise_error(RuntimeError)
  end
  it 'should clear the image' do
    img.create_image(5, 4, 'O')
    img.clear('C')
    expect(img.pixels[2].color).to eq('C')
  end
  it 'should draw the image as created' do
    img.create_image(5, 4, 'O')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOOOOO\nOOOOO\n")
    img.inspect
  end
  it 'should draw the image after cleaning' do
    img.create_image(5, 4, 'O')
    img.clear('C')
    expect(img).to receive(:print).with("CCCCC\nCCCCC\nCCCCC\nCCCCC\n")
    img.inspect
  end
  it 'should color the pixel[2,4] in image with color T' do
    img.create_image(5, 4, 'O')
    img.colored_pixel(2,4,'T')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOOOOO\nOTOOO\n")
    img.inspect
  end
  it 'should color the line of pixels [2,2],[2,3],[2,4] color M' do
    coord = [[2,3],[2,4],[2,2]]
    img.create_image(5, 4, 'O')
    img.colored_pixels(coord,'M')
    expect(img).to receive(:print).with("OOOOO\nOMOOO\nOMOOO\nOMOOO\n")
    img.inspect
    img.clear
  end
  it 'should color the line of pixels [2,1][2,2][2,3] color M' do
    coord = [[2,1],[2,2],[2,3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels(coord,'M')
    expect(img).to receive(:print).with("OMOOO\nOMOOO\nOMOOO\nOOOOO\n")
    img.inspect
  end
  it 'should get the color of the pixels [2,2] => O and [2,3] => M' do
    coord = [[1,3],[2,3],[3,3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels(coord,'M')
    expect(img.find_pixel_color(2,2)).to eq('O')
    expect(img.find_pixel_color(2,3)).to eq('M')
  end
  it 'should select same M color pixel[1,3] pixels in image' do
    arr, coord = [],[[1, 3], [2, 3], [2, 4], [3, 3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels(coord,'M')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nMMMOO\nOMOOO\n")
    img.inspect
    img.same_color_pixels(1,3).each{|px| arr << [px.x,px.y] }
    expect(arr).to eq([[1, 3], [2, 3], [3, 3], [2, 4]])
  end
  it 'should get the neighbors coordinates of pixel [3,3] and [5,4]' do
    result,result1 = [],[]
    img.create_image(5, 4, 'O')
    arr = [[2, 2], [3, 2], [4, 2], [2 ,3], [3, 3], [4, 3], [2, 4], [3, 4], [4, 4]]
    calc = img.find_pixel_neighbors(3,3)
    calc.each{|px| result << [px.x,px.y] }
    expect(result).to eq(arr)
    arr1 = [[4, 3], [5, 3], [4, 4], [5, 4]]
    calc1 = img.find_pixel_neighbors(5,4)
    calc1.each{|px| result1 << [px.x,px.y] }
    expect(result1).to eq(arr1)
  end
  

end	