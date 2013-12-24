module Editor

def interactive_menu
  loop do
    menu_choice(menu_option_output_phrase)
  end
end

def program_menu
  print_out(@menu_commands_help.join("\n"), false)
end

def print_out(phrases, local = true)
  print @program_phrases[phrases] if local
  print phrases if !local
end

def menu_option_output_phrase
  print_out("p_command")
  $stdin.gets.chomp
end

def prepare_command(letter, other = [])
  true
end

def command_exist?(command)
  menu_comands = ["I","C","L","V","H","F","S","X","R"]
  option = command.split(' ')
  return true if menu_comands.any?{|letter| letter == option[0]} 
  false
end

def check_command(command)
  return '-h' if command == '-h' 
  return command.split(' ')[0] if command_exist?(command) 
  print_out("undef_command") 
  return nil
end

def make_pixels_coord(segment, x1, x2, x3)
  result = []
  if segment.eql?("V")
    x2.upto(x3){|iter|
      result << [x1,iter]
    }
  else
    x1.upto(x2){|iter|
      result << [iter,x3]
    }
  end
  result
end

def area_color(x,y,new_color)
  full_array = []
  pixels_arr = @img.select_same_color_pixels(x,y)
  pixels_arr.each{|coor|
    full_array << @img.get_pixel_neighbors_coord(coor.x,coor.y)
  }
  #p full_array
  @img.color_pixels_object(full_array.flatten(1).uniq,new_color)

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
        @img.color_the_pixel(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3])
      end
    when "V"
      if prepare_command("V",command)
          color = command.split(' ')[4]
         arry = make_pixels_coord("V",command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3].to_i)
         @img.color_pixels(arry,color)
      end
    when "H"
        if prepare_command("H",command)
         color = command.split(' ')[4]
         arry = make_pixels_coord("H",command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3].to_i)
         @img.color_pixels(arry,color)
      end
    when "F"
         area_color(command.split(' ')[1].to_i,command.split(' ')[2].to_i,command.split(' ')[3])
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