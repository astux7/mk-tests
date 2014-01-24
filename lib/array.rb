class Array
  def implant(start = nil )
    return nil if !block_given?
    # what's the point of setting starter to 0 if start.nil?
    # if starter will be overwritten on line 9 anyway?
    starter = (start == nil ? 0 : start)

    if start.nil? 
      starter = self.first
      self.each do |element|
        # this is dangerous. I wrote a test that fails because of this line
        # Basically, it's unsafe to assume that the first element
        # will be different from all others
        next if element == starter
        starter = yield starter, element
        # don't put puts() in the code, otherwise your code
        # will be impossible to use in a real situation
        # Also, it makes rspec output look bad   
        # Finally, because you're calling the block twice,
        # this may have unintended side-effects (what if a block maintains some internal state?)     
      end
    else
      # there's a lot of repetition here.
      # Essentially, the else block is the same as the if block
      # What if you did something like
      #    self.slice(from..-1).each
      # to iterate and changed the from variable depending on
      # whether you have an argument
      self.each do |element|
        starter = yield starter,element        
      end
    end
    starter
  end

end