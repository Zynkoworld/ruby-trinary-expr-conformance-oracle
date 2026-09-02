class Trinary
  BASE = 3

  attr_reader :digits
  def initialize(decimal)
    decimal = '0' unless decimal.match(/\A[012]+\z/)
    @digits = decimal.reverse.chars.collect(&:to_i)
  end

  def to_decimal
    decimal = 0
    digits.each_with_index do |digit, index|
      decimal += digit * BASE**index
    end
    decimal
  end
end

require 'json'
__exprs = JSON.parse("[\"Trinary.new('1').to_decimal\", \"Trinary.new('2').to_decimal\", \"Trinary.new('10').to_decimal\", \"Trinary.new('11').to_decimal\", \"Trinary.new('100').to_decimal\", \"Trinary.new('112').to_decimal\", \"Trinary.new('222').to_decimal\", \"Trinary.new('1122000120').to_decimal\", \"Trinary.new('carrot').to_decimal\", \"Trinary.new('0a1b2c').to_decimal\", \"Trinary.new(\\\"Invalid\\\\n201\\\\nString\\\").to_decimal\", \"Trinary.new('4').to_decimal\"]")
__out = []
__exprs.each do |e|
  begin
    __out << {ok: true, v: eval(e)}
  rescue => ex
    __out << {ok: false, e: ex.class.to_s}
  end
end
puts JSON.generate({out: __out})
