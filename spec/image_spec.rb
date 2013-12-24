require_relative '../lib/image'

describe Image do
  before(:all) {
    @img = Image.new
    @img.create_image(4, 5, 'O')
  }
  
  it 'should create an image' do
     expect(@img.pixels_count).to eq(20)
  end
  it 'should raise the error if the MxN out of range 1..250' do 
    img1 = Image.new
    expect(lambda { img1.create_image(300,200)}).to raise_error(RuntimeError)
  end
  it 'should clear the image' do
    @img.clear
    expect(@img.pixels[2].color).to eq('C')
  end
  it 'should draw the image as created' do
    @img.clear('O')
    expect(@img).to receive(:print).with("OOOOO\nOOOOO\nOOOOO\nOOOOO\n")
    @img.inspect
  end
  it 'should draw the image after cleaning' do
    @img.clear
    expect(@img).to receive(:print).with("CCCCC\nCCCCC\nCCCCC\nCCCCC\n")
    @img.inspect
  end
  it 'should color the pixel[2,4] in image with color T' do
    @img.clear('O')
    @img.color_the_pixel(2,4,'T')
    expect(@img).to receive(:print).with("OOOOO\nOOOTO\nOOOOO\nOOOOO\n")
    @img.inspect
  end
  it 'should color the line of pixels [2,3][2,4][2,5] color M' do
    coord = [[2,3],[2,4],[2,5]]
    @img.draws_image_lines(coord,'M')
    expect(@img).to receive(:print).with("OOOOO\nOOMMM\nOOOOO\nOOOOO\n")
    @img.inspect
    @img.clear('O')
  end
  it 'should color the line of pixels [1,3][2,3][3,3] color M' do
    coord = [[1,3],[2,3],[3,3]]
    @img.draws_image_lines(coord,'M')
    expect(@img).to receive(:print).with("OOMOO\nOOMOO\nOOMOO\nOOOOO\n")
    @img.inspect
  end
  it 'should get the color of the pixels [2,2] => O and [2,3] => M' do
    coord = [[1,3],[2,3],[3,3]]
    @img.draws_image_lines(coord,'M')
    expect(@img.get_pixel_color(2,2)).to eq('O')
    expect(@img.get_pixel_color(2,3)).to eq('M')
  end
  it 'should select same M color pixel[1,3] pixels in image' do
    arr, coord = [],[[1, 3], [2, 3], [2, 4], [2, 5], [3, 3]]
    @img.draws_image_lines(coord,'M')
    expect(@img).to receive(:print).with("OOMOO\nOOMMM\nOOMOO\nOOOOO\n")
    @img.inspect
    @img.select_same_color_pixels(1,3).each{|px| arr << [px.x,px.y] }
    expect(arr).to eq(coord)
  end
  it 'should get the neighbors coordinates of pixel [3,4] and [1,5]' do
    result,result1 = [],[]
    arr = [[2, 3], [3, 3], [4, 3], [2, 4], [3, 4], [4, 4], [2, 5], [3, 5], [4, 5]]
    calc = @img.get_pixel_neighbors_coord(3,4)
    calc.each{|px| result << [px.x,px.y] }
    expect(result).to eq(arr)
    arr1 = [[1, 4], [2, 4], [1, 5], [2, 5]]
    calc1 = @img.get_pixel_neighbors_coord(1,5)
    calc1.each{|px| result1 << [px.x,px.y] }
    expect(result1).to eq(arr1)
  end
  

end	