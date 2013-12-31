require_relative '../lib/error_handler'
class ErrorHandling; include ErrorHandler; end

describe ErrorHandling do
  let(:err){ErrorHandling.new}

  it 'should return color if the color is letter' do
    expect(err.check_color?("K")).to be_true
  end

  it 'should return error if the color is not letter' do
    expect(lambda { err.check_color?(9)}).to raise_error(RuntimeError)
  end

  it 'should return coordinate if it is in range' do
    expect(err.check_coordinate(4,9)).to eq(4)
  end

  it 'should return error if the coordinate is not correct' do
    expect(lambda { err.check_coordinate(460,9)} ).to raise_error(RuntimeError)
  end

  it 'should return coordinate true if image in good range' do
    expect(err.check_image_range?(4,9)).to be_true
  end
  
  it 'should return error if the image is not correct size' do
    expect(lambda { err.check_image_range?(-46,900)} ).to raise_error(RuntimeError)
  end

  it 'should return true if 1st coord is less then 2nd' do
    expect(err.x_bigger_y?(4,9)).to be_true
  end
  
  it 'should raise error if the 1st coord is greater then 2nd' do
    expect(lambda { err.x_bigger_y?(10,9)} ).to raise_error(RuntimeError)
  end

  it 'should return true if command arguments correct' do
    expect(err.check_arguments_number?(["I", "3" ,"3"],3)).to be_true
  end
  
  it 'should raise error if command arguments is not correct' do
    expect(lambda { err.check_arguments_number?(["I","3"],3)} ).to raise_error(RuntimeError)
  end

  it 'should return true if array of possitive numbers in range' do
    expect(err.check_if_positive_integers?(["1", "3" ,"3"])).to be_true
  end
  
  it 'should raise error if array of not possitive numbers in range' do
    expect(lambda { err.check_if_positive_integers?(["4","3","-3"])} ).to raise_error(RuntimeError)
  end

  it 'should return error if the coordinate is not integer' do
    expect(lambda { err.is_numeric?(0.4)} ).to raise_error(RuntimeError)
  end

  it 'should return true if integer' do
    expect( err.is_numeric?(4) ).to be_true
  end

end