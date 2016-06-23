require 'test/unit'
extend Test::Unit::Assertions

class Positions
  attr_accessor :locations, :numOfTravelers, :infiniteMap

  def initialize()
    @locations = []
    @numOfTravelers = 0
    @infiniteMap = {}

  end
  def markLocation(coords)
    x = coords[0]
    y = coords[1]
    beenHereBefore = false
    @infiniteMap[x] = {} if @infiniteMap[x] == nil
    beenHereBefore = true if @infiniteMap[x][y] == true
    @infiniteMap[x][y] = true
    return beenHereBefore
  end
  def addTraveler(coords)
    @locations << coords
    ret = markLocation(coords)
    @numOfTravelers += 1
    return ret
  end
  def move(xDiff, yDiff, moveUser = 0)
    @locations[moveUser][0] += xDiff
    @locations[moveUser][1] += yDiff
    ret = markLocation(@locations[moveUser])
  end
end


underTest = Positions.new()
assert(underTest.addTraveler([0,0]) == false);
assert(underTest.move(1,0) == false)
assert(underTest.move(0,1) == false)
assert(underTest.move(0,-1) == true)
assert(underTest.move(0,0) == true)
assert(underTest.markLocation([0,0]) == true)
assert(underTest.markLocation([-1,0]) == false)




class Grid
  attr_accessor :positions, :uniqueLocations

  def initialize(coordinates= [[0,0]], numberOfUsers= 1)
    @uniqueLocations = 0
    @positions = Positions.new
    coordinates.each do |coords|
                        ret = @positions.addTraveler(coords)
                        @uniqueLocations += 1 if !ret
                      end
  end

  def move(xDiff = 0, yDiff = 0, moveUser = 0)
    @uniqueLocations += 1 if !@positions.move(xDiff, yDiff, moveUser)
  end
end

underTest = Grid.new([[0,0]])
assert(underTest.uniqueLocations == 1)
underTest.move(1,0)
assert(underTest.uniqueLocations == 2)





class SantaPath
  attr_accessor :grid, :instruction_number
  def initialize(origins = [[0,0]],numOfSantas = 1)
    @grid = Grid.new(origins,numOfSantas)
    @instruction_number = 0
  end

  def feedArrow(arrow)
    xDiff = 0
    yDiff = 0
    if arrow == '<'
      xDiff = -1
    elsif arrow =='>'
      xDiff = 1
    elsif arrow == '^'
      yDiff = 1
    elsif arrow == 'v'
      yDiff = -1
    else
      puts "bad character: #{arrow}"
      exit
    end
    deliver(xDiff, yDiff)
    @instruction_number += 1
  end

  def deliver(xDiff, yDiff, santaNum = 0)
    @grid.move(xDiff, yDiff, selectSanta)
  end

  def selectSanta
    0
  end
end


def deliverEverything(mySanta)
  f = File.new('input', 'r')
  f.each_char { |chr| mySanta.feedArrow(chr)}
  puts "gifts delivered to unique homes: #{mySanta.grid.uniqueLocations}"
  f.close
end

deliverEverything(SantaPath.new)

class SantaPath
  def selectSanta
    return @instruction_number%2
  end
end


deliverEverything(SantaPath.new([[0,0], [0,0]], 2))
