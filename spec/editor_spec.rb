require_relative '../lib/editor'

describe Editor do
  let(:image) {double(:image,:pixels_count => 3)}
  let(:editor) { Editor.new(image) }
  
  it 'should init the editor and terminate it' do
    expect(editor.image).to be_true
  end
  
  it 'should check the commands if it has ' do
    expect(editor.command_exist?("C")).to be_true
    expect(editor.command_exist?('U')).to be_false
  end

  it 'should return only command  letter if it has in program' do
    expect(editor.check_command("I 4 4")).to eq("I")
    expect(editor.check_command("-h")).to eq("-h")
    expect(editor).to receive(:print).with("\nEditor do not know this command, for help put -h \n ")
    expect(editor.check_command("K 88 9")).to be_false
  end  

  it 'should raise error cause not init the image first for F 3 3 J' do
    expect(editor.prepare_command("F 3 3 J")) .to eq(["3","3","J"])
  end

  it 'should return empty array if command missing arguments F 3 3' do
    editor.prepare_command("I 4 4")
    expect(editor).to receive(:print).with("Arguments missing in Command")
    expect(editor.prepare_command("F 3 3")) .to eq([])
  end
  it 'should return the args for method F 3 3 J' do
    editor.prepare_command("I 4 4")
    expect(editor.prepare_command("F 3 3 J")) .to eq(["3","3","J"])
  end

end	