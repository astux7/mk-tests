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
    expect(img.inspect).to eq("CCCCC\nCCCCC\nCCCCC\nCCCCC\n")
  end

  it 'should draw the image as created' do
    img.create_image(5, 4, 'O')
    expect(img.inspect).to eq("OOOOO\nOOOOO\nOOOOO\nOOOOO\n")
  end

  it 'should colored the pixel [2,4] in image with color T' do
    img.create_image(5, 4, 'O')
    img.colored_pixel(2,4,'T')
    expect(img.inspect).to eq("OOOOO\nOOOOO\nOOOOO\nOTOOO\n")
  end

  it 'should color the line of pixels [2,1][2,2][2,3] color M' do
    coord = [[2,1],[2,2],[2,3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels_by_coordinates(coord,'M')
    expect(img.inspect).to eq("OMOOO\nOMOOO\nOMOOO\nOOOOO\n")
  end

  it 'should get the color of the pixels [2,2] => O and [2,3] => M' do
    coord = [[1,3],[2,3],[3,3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels_by_coordinates(coord,'M')
    expect(img.find_pixel_color(2,2)).to eq('O')
    expect(img.find_pixel_color(2,3)).to eq('M')
  end

  it 'should select same M color as pixel[1,3] pixels in image' do
    arr, coord = [],[[1, 3], [2, 3], [2, 4], [3, 3]]
    img.create_image(5, 4, 'O')
    img.colored_pixels_by_coordinates(coord,'M')
    expect(img.inspect).to eq("OOOOO\nOOOOO\nMMMOO\nOMOOO\n")
    img.same_color_pixels(1,3).each{|px| arr << [px.x,px.y] }
    expect(arr).to eq([[1, 3], [2, 3], [3, 3], [2, 4]])
  end

  it 'should colored the neighbors of pixel [3,3] with color G' do
    img.create_image(5, 4, 'O')
    #[[2, 2], [3, 2], [4, 2], [2 ,3], [3, 3], [4, 3], [2, 4], [3, 4], [4, 4]]
    img.find_pixel_neighbors(3,3,'G')
    expect(img.inspect).to eq("OOOOO\nOOGOO\nOGGGO\nOOGOO\n")
  end
   it 'should colored the neighbors of pixel [5,4] with color G' do
    img.create_image(5, 4,'O')
    #[[4, 3], [5, 3], [4, 4], [5, 4]]
    img.find_pixel_neighbors(5,4, "G")
    expect(img.inspect).to eq("OOOOO\nOOOOO\nOOOOG\nOOOGG\n")
  end

  it 'should colored the vertical line [2 3][2 4] W color' do
    img.create_image(5, 4, 'O')
    img.draw_vertical_line(2,3,4,'W')
    expect(img.inspect).to eq("OOOOO\nOOOOO\nOWOOO\nOWOOO\n")
  end  

  it 'vertical line rise the error if not good params given' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.draw_vertical_line(2,3,4,9)}).to raise_error(RuntimeError)
    expect(lambda { img.draw_vertical_line(2,6,4,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.draw_vertical_line(33,3,4,'O')}).to raise_error(RuntimeError)
  end 

  it 'should colored the horizontal line [3 2][4 2] Z color' do
    img.create_image(5, 4, 'O')
    img.draw_horizontal_line(3,4,2,'Z')
    expect(img.inspect).to eq("OOOOO\nOOZZO\nOOOOO\nOOOOO\n")
  end  

  it 'horizontal line rise the error if not good params given' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.draw_horizontal_line(2,3,4,9)}).to raise_error(RuntimeError)
    expect(lambda { img.draw_horizontal_line(5,3,2,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.draw_horizontal_line(33,3,4,'O')}).to raise_error(RuntimeError)
  end  

  it 'should colored area R with color F' do
    img.create_image(5, 4, 'O')
    arr = [[2, 2], [3, 2], [4, 2], [2 ,3], [3, 3], [4, 3], [2, 4], [3, 4], [4, 4]]
    img.colored_pixels_by_coordinates(arr, 'U')
    img.selected_area_to_fill(1,2,'F')
    expect(img.inspect).to eq("FFFFF\nFFFFF\nFFUFF\nFFUFF\n")
  end 

  it 'should raise error for bad args of filling area' do
    img.create_image(5, 4, 'O')
    expect(lambda { img.selected_area_to_fill(1,2,'i')}).to raise_error(RuntimeError)
    expect(lambda { img.selected_area_to_fill(7,2,'P')}).to raise_error(RuntimeError)
    expect(lambda { img.selected_area_to_fill(1,'O',9)}).to raise_error(RuntimeError)
  end 
  
  it 'should make the final image steps' do
    img.create_image(5, 6, 'O')
    img.colored_pixel(2,3,'A')
    expect(img.inspect).to eq("OOOOO\nOOOOO\nOAOOO\nOOOOO\nOOOOO\nOOOOO\n")
    img.selected_area_to_fill(3,3,'J')
    img.draw_vertical_line(2,3,4,'W')
    img.draw_horizontal_line(3,4,2,'Z')
    expect(img.inspect).to eq("JJJJJ\nJJZZJ\nJWJJJ\nJWJJJ\nJJJJJ\nJJJJJ\n")
  end 

end	