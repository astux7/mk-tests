require_relative 'image'
module Editor

def interactive_menu
  #program_menu
  @img = Image.new
  looping_via_menu
end

def looping_via_menu
  loop do
    menu_choice(menu_option_output_phrase)
  end
end

def program_menu

end

def menu_option_output_phrase
  puts "\nput the command:"
  $stdin.gets.chomp
end

menu_commands_help = [
  "I M N - Create image MxN",
  "C - Clear the image setting pixels to white (O)"

]

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
  return command.split(' ') if command_exist?(command) 
  print "\n Editor do not know this command \n "
  return []
end

def menu_choice(command)
    choices = check_command(command)
    case choices[0]
      when "I"
       if prepare_command("I",command)
          n = choices[1].chomp(' ').to_i
          m = choices[2].chomp(' ').to_i
          @img.create_image(n,m)
       end
      when "C"
        @img.clear
      when "L"
        @img.color_the_pixel(choices[1].to_i,choices[2].to_i,choices[3])
      when "V"
        puts find_student
      when "H"
        print_students
      when "F"
        students_statistic
      when "S"
        @img.inspect
      when "R"
        system("clear")
      when "X"
        exit
      else
        program_menu
    end

end
end