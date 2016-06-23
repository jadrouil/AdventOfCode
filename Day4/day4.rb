require 'digest'

input = 'ckczppom'

class NumberGetter
  def initialize
    @num = 0
  end
  def getNextNumber
    @num += 1
    return @num
  end
end

class StringFormer
  def initialize(str = '')
    @str = str
  end
  def concatonateNumber(num)
    str = @str
    str += num.to_s.chomp
    return str
  end
end


class SubstringChecker
  def initialize(findHex =[0,0,0,0,0], pos = 0)
    @find = findHex
    @pos = pos
  end

  def checkHex(str)
    i = 0
    @find.each do |chr|
      return false unless str[i + @pos].hex == chr
      i += 1
    end
    return true
  end
end

class AdventCodeFinder
  def initialize(findHex = [0,0,0,0,0],pos = 0,code = 'ckczppom')
    @substrChk = SubstringChecker.new(findHex,pos)
    @strFrm = StringFormer.new(code)
    @numGet = NumberGetter.new
  end
  def find(upperLimit = nil)
    while true
      newNum = @numGet.getNextNumber
      str = @strFrm.concatonateNumber(newNum)
      s = Digest::MD5.hexdigest str
      return newNum if @substrChk.checkHex(s)
      return -1 if upperLimit == newNum
    end
  end
end

# This was for part 1. no need to run it when running for part2
# r = AdventCodeFinder.new
# puts "found num #{r.find}"

r = AdventCodeFinder.new([0,0,0,0,0,0], 0)
puts "found num part 2 #{r.find}"
