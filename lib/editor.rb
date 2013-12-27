require_relative 'error_handler'

class Editor

include ErrorHandler

attr_reader :image

def initialize(image = nil)
  @image = image
  editor_constants
  #interactive_menu
end

def editor_constants
  @menu_commands_help = [
    "\n\nEditor Commands as follow:\n",
    "> I M N - Create image MxN\n",
    "> C - Clear the image setting pixels to white (O)\n",
    "> L X Y C - Colours the pixel (X,Y) with colour C\n",
    "> V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2\n",
    "> H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2\n",
    "> F X Y C - Fill the region R with the colour C. R is defined as: Pixel (X,Y) belongs to R. Any other pixel which is the same colour as (X,Y) and shares a common side with any pixel in R also belongs to this region.\n",
    "> S - Show the contents of the current image\n",
    "> R - Clear the console\n",
    "> X - Terminate the session\n"
  ]

  @program_phrases = {
    "p_command" => "\nChoose the command: ",
    "undef_command" => "\nEditor do not know this command, for help put -h \n ",
    "bad_coordinate" => "\n Image coordinates are wrong"
  }
end

def interactive_menu
  loop do
    menu_choice(menu_option_output)
  end
end

def program_menu
  print_out(@menu_commands_help.join("\n"), false)
end
#printing to console - inlist means if the phrase belongs 
#to program phrase list
def print_out(phrases, in_list = true) 
    print phrases if !in_list 
    print @program_phrases[phrases] if !@program_phrases[phrases].nil? && in_list 
end
#output text and get the command
def menu_option_output
  print_out("p_command")
  $stdin.gets.chomp
end

def command_exist?(command)
  menu_comands = ["I","C","L","V","H","F","S","X","R"]
  option = command.split(' ')
  return menu_comands.any?{|letter| letter == option[0]} ? true : false
end

def command_not_exist
  print_out("undef_command") 
  false
end

def image_defined?
  raise "First create the image!" if @image.pixels_count < 2
  true
end

def check_command(command)
  return '-h' if command == '-h' 
  return command_exist?(command) ? command.split(' ')[0] : command_not_exist
end
#prepare the command for image
def prepare_command(commands )
  command = commands.split(' ')
  begin
    image_defined? if !["I", "X", "R"].include? command[0]
    case command[0]
      when "V", "H"
        check_arguments_number(command,5)
        coords = [command[1],command[2],command[3]]
        if check_if_positive_integers(coords) && check_color(command[4]) 
          return [command[1],command[2],command[3], command[4]]    
        end
      when "F", "L"
        check_arguments_number(command,4)
        coords = [command[1],command[2]]
        if check_if_positive_integers(coords) && check_color(command[3])
          return [command[1],command[2],command[3]] 
        end
      when "I"
        check_arguments_number(command,3)
        return [command[1], command[2]] if check_image_range(command[1], command[2]) 
    end
  rescue Exception => e  
    print e.message  
  end
  return []
end 

def menu_choice(command)
  begin
    letter = check_command(command)
    param = letter ? prepare_command(command) : []
    case letter
      when "I"
        @image.create_image(param[0], param[1]) if !param.empty?
      when "C"
        @image.clear 
      when "L"
       @image.colored_pixel(param[0], param[1], param[2]) if !param.empty?
      when "V"
        @image.vertical_line(param[0], param[1], param[2], param[3]) if !param.empty?
      when "H"
        @image.horizontal_line(param[0], param[1], param[2], param[3]) if !param.empty?
      when "F"
        @image.select_area_to_fill(param[0],param[1],param[2]) if !param.empty?
      when "S"
        @image.inspect
      when "R"
        system("clear")
      when "X"
        exit
      when "-h"
        program_menu
      end
  rescue Exception => e  
    exit if letter == "X"
    print e.message  
  end 
end

end