
filename = "input"
f = File.new(filename, 'r')

class Gift
  attr_accessor :length, :width, :height
  def initialize(rawstring)
    array = rawstring.split('x')
    @length = array[0].to_i
    @width = array[1].to_i
    @height = array[2].to_i
  end

  def calcWrappingPaper
    lxw = @length * @width
    lxh = @length * @height
    wxh = @width * @height
    surfaces = [lxw, lxh, wxh]
    surfaces = surfaces.sort
    return (surfaces[0]*3 + surfaces[1] * 2 + surfaces[2] * 2)
  end
end


totalWrappingPaper = 0

f.each do |line|
  break if line.chomp.empty?
  g = Gift.new(line)
  totalWrappingPaper += g.calcWrappingPaper
end


puts "totalWrappingPaper: #{totalWrappingPaper}"
f.close

class Gift
  def calcRibbon
    dimensions = [@length, @width, @height]
    dimensions = dimensions.sort

    return(2*(dimensions[0] + dimensions[1]) + @length*@width*@height)
  end
end

f = File.new(filename, 'r')
totalRibbon = 0

f.each do |line|
  break if line.chomp.empty?
  g = Gift.new(line)
  totalRibbon += g.calcRibbon
end


puts "totalRibbon: #{totalRibbon}"
f.close
