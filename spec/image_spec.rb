require_relative '../lib/image'

describe Image do
  let(:img) { Image.new }

  it 'should create an image' do
    img.create_image('5', '4', 'O')
    expect(img.pixels_count).to eq(20)
  end

  it 'should raise the error if the MxN out of range 1..250' do 
    img1 = Image.new
    expect(lambda { img1.create_image(300,200)}).to raise_error(RuntimeError)
  end

  it 'should clear the image' do
    img.create_image(5, 4, 'O')
    img.clear('C')
    expect(img).to receive(:print).with("CCCCC\nCCCCC\nCCCCC\nCCCCC\n")
    img.inspect
  end

  it 'should draw the image as created' do
    img.create_image(5, 4, 'O')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOOOOO\nOOOOO\n")
    img.inspect
  end

  it 'should colored the pixel [2,4] in image with color T' do
    img.create_image(5, 4, 'O')
    img.colored_pixel(2,4,'T')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOOOOO\nOTOOO\n")
    img.inspect
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

  it 'should select same M color as pixel[1,3] pixels in image' do
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

  it 'should colored the vertical line [2 3][2 4] W color' do
    img.create_image(5, 4, 'O')
    img.vertical_line(2,3,4,'W')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOWOOO\nOWOOO\n")
    img.inspect
  end  

  it 'vertical line rise the error if not good params given' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.vertical_line(2,3,4,9)}).to raise_error(RuntimeError)
    expect(lambda { img.vertical_line(2,6,4,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.vertical_line(33,3,4,'O')}).to raise_error(RuntimeError)
  #  expect(lambda { img.vertical_line(33,3,'O')}).to raise_error(RuntimeError)
  end 

  it 'should colored the horizontal line [3 2][4 2] Z color' do
    img.create_image(5, 4, 'O')
    img.horizontal_line(3,4,2,'Z')
    expect(img).to receive(:print).with("OOOOO\nOOZZO\nOOOOO\nOOOOO\n")
    img.inspect
  end  

  it 'horizontal line rise the error if not good params given' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.horizontal_line(2,3,4,9)}).to raise_error(RuntimeError)
    expect(lambda { img.horizontal_line(5,3,2,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.horizontal_line(33,3,4,'O')}).to raise_error(RuntimeError)
  #  expect(lambda { img.vertical_line(33,3,'O')}).to raise_error(RuntimeError)
  end  

  it 'should colored area R with color F' do
    img.create_image(5, 4, 'O')
    arr = [[2, 2], [3, 2], [4, 2], [2 ,3], [3, 3], [4, 3], [2, 4], [3, 4], [4, 4]]
    img.colored_pixels(arr, 'U')
    img.select_area_to_fill(1,2,'F')
    expect(img).to receive(:print).with("FFFFF\nFFFFF\nFFUFF\nFFUFF\n")
    img.inspect
  end 

  it 'should raise error for bad args of filling area' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.select_area_to_fill(1,2,'i')}).to raise_error(RuntimeError)
    expect(lambda { img.select_area_to_fill(7,2,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.select_area_to_fill(1,'O',9)}).to raise_error(RuntimeError)
  end 
  
  it 'should make the final image steps' do
    img.create_image(5, 6, 'O')
    img.colored_pixel(2,3,'A')
    expect(img).to receive(:print).with("OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO\n")
    img.inspect
    img.select_area_to_fill(3,3,'J')
    img.vertical_line(2,3,4,'W')
    img.horizontal_line(3,4,2,'Z')
    expect(img).to receive(:print).with("JJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ\n")
    img.inspect
  end 

end	