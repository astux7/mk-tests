require './lib/editor'


RubyVM::InstructionSequence.compile_option = {
  :tailcall_optimization => true,
  :trace_instruction => false
}

editor = Editor.new
editor.interactive_menu


