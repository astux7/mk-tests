require_relative 'error_handler'
require_relative 'image'

class Editor

  include ErrorHandler

  attr_accessor :image

  def initialize(image = nil)
    @image = image
  end

  def interactive_menu
    loop do
      menu_choice(menu_option_output)
    end
  end

  def program_menu
    user_output("menu")
  end

  #output text and get the command
  def menu_option_output
    user_output("p_command")
    $stdin.gets.chomp
  end

  def command_exist?(command)
    menu_comands = ["I","C","L","V","H","F","S","X","R"]
    option = command.split(' ')
    return menu_comands.any?{|letter| letter == option[0]} ? true : false
  end

  def image_defined?
    user_output("create_img", true) if @image.nil?
    return true
  end

  def check_command(command)
    return '-h' if command == '-h' 
    return command_exist?(command) ? command.split(' ')[0] : user_output("undef_command", true) 
  end

  def prepare_parameters(command, counter, iter)
    check_arguments_number?(command, counter)
    command.shift
    return command
  end

  def prepare_menu_commands(command)
    case command[0]
        when "V", "H"
          return prepare_parameters(command, 5, 3)
        when "F", "L"
          return prepare_parameters(command, 4, 2)
        when "I"
          return [command[1], command[2]] if check_arguments_number?(command, 3)
        when "R", "S", "C", "X"
          check_arguments_number?(command, 1)
       end
  end

  #prepare the command for image
  def prepare_command(arguments)
    command = arguments.split(' ')
    image_defined? if !["I", "X", "R", "-h"].include? command[0]
    return prepare_menu_commands(command)
  end 

  def menu_choice_commands(letter, param)
    case letter
        when "I"
          @image = Image.new
          @image.create_image(param[0], param[1]) if !param.empty?
        when "C"
          @image.clear 
        when "L"
         @image.colored_pixel(param[0], param[1], param[2]) if !param.empty?
        when "V"
          @image.draw_vertical_line(param[0], param[1], param[2], param[3]) if !param.empty?
        when "H"
          @image.draw_horizontal_line(param[0], param[1], param[2], param[3]) if !param.empty?
        when "F"
          @image.selected_area_to_fill(param[0],param[1],param[2]) if !param.empty?
        when "S"
          print @image.inspect
        when "R"
          system("clear")
        when "X"
          exit
        when "-h"
          program_menu
    end
  end

  def prepare_menu_choice(command, letter)
    param = letter ? prepare_command(command) : []
    return menu_choice_commands(letter, param)
  end

  def menu_choice(command)
    begin
      return prepare_menu_choice(command, check_command(command))
    rescue Exception => e  
      exit if command.eql?("X")
      print e.message  
    end 
  end

end