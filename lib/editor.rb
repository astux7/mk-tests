module Editor

def interactive_menu
  loop do
    menu_choice(menu_option_output)
  end
end

def program_menu
  print_out(@menu_commands_help.join("\n"), false)
end
#printing to console - inlist means if the phrase belongs to program phrase list
def print_out(phrases, inlist = true)
  print inlist ? @program_phrases[phrases] : phrases 
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
  nil
end

def check_command(command)
  return '-h' if command == '-h' 
  return command_exist?(command) ? command.split(' ')[0] : command_not_exist
end

#def area_color(x,y,new_color)
#  full_array = []
  #pixels_arr = @img.select_same_color_pixels(x,y)
  #pixels_arr.each{|coor|
   # full_array << @img.get_pixel_neighbors_coord(coor.x,coor.y)
  #}
  #p full_array
 # @img.color_pixels_object(full_array.flatten(1).uniq,new_color)

#end
#!!!!!!!
def prepare_command(letter, other = [])
  true
end 

def menu_choice(command)
  case check_command(command)
    when "I"
       if prepare_command("I",command)
          m = command.split(' ')[1].chomp(' ').to_i
          n = command.split(' ')[2].chomp(' ').to_i
          @img.create_image(m,n)
       end
    when "C"
      @img.clear
    when "L"
      if prepare_command("L",command)
        @img.colored_pixel(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3])
      end
    when "V"
      if prepare_command("V",command)
          color = command.split(' ')[4]
         @img.vertical_line(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3].to_i, color)
        # @img.colored_pixels(arry,color)
      end
    when "H"
        if prepare_command("H",command)
         color = command.split(' ')[4]
         @img.horizontal_line(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3].to_i,color)
        # @img.colored_pixels(arry,color)
      end
    when "F"
        @img.select_area_to_fill(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3])
    when "S"
      @img.inspect
    when "R"
      system("clear")
    when "X"
      exit
    when "-h"
      program_menu
    end
end

end