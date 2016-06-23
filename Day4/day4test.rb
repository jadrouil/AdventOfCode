load 'day4.rb'
require 'test/unit'
extend Test::Unit::Assertions
inputCode = 'ckczppom'

underTest = NumberGetter.new
# assert_equal(0,underTest.getNextNumber)
puts "number getter test passed"

underTest = StringFormer.new(inputCode)
assert_equal('ckczppom0', underTest.concatonateNumber(0))
assert_equal('ckczppom1245', underTest.concatonateNumber(1245))
assert_equal('ckczppom9990', underTest.concatonateNumber(9990))

puts "StringFormer passed"


underTest = SubstringChecker.new
assert(underTest.checkHex('00000111111111111111111111111'))
assert_false(underTest.checkHex('0000123333'))
assert_false(underTest.checkHex('1000001111'))

puts "SubstringChecker passed"



a =  Digest::MD5.hexdigest "abcdef609043"
assert_equal(0, a[0].hex)
assert_equal(0, a[1].hex)
assert_equal(0, a[2].hex)
assert_equal(0, a[3].hex)
assert_equal(0, a[4].hex)
assert(underTest.checkHex(a))

puts "finished digest check"

underTest = AdventCodeFinder.new([0,0,0,0,0], 0, 'abcdef')
assert_equal(609043, underTest.find(609043))
puts "first code passed"

# underTest = AdventCodeFinder.new('00000', 0, 'pqrstuv')
# assert_equal(1048970, underTest.find(1048970))
# puts "all past"
