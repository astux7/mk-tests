require './lib/image'
require './lib/editor'
include Editor

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
  "undef_command" => "\nEditor do not know this command, for help put -h \n "
}

@img = Image.new
interactive_menu

