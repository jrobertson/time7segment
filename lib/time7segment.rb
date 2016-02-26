#!/usr/bin/env ruby

require 'rpi'


# file: time7segment.rb

# Quick pin reference
# ===================
#
#     index:  0  1  2  3   4   5  6   7
#   segment:  a  b  c  d   e   f  g  dp
# 7 seg pin: 11  7  4  2   1  10  5   3
#  GPIO pin: 11  4 23  8  20  10 18  25


class Time7Segment

  #                      d1 d2 d3 d4  a b  c d e   f  g dp
  def initialize(gpio_pins=%w(22 27 17 24 11 4 23 8 20 10 18 25), 
                                                        refresh: 0.0025)

    pins = RPi.new(gpio_pins).pins
    @digits, @segments = pins.take(4), pins.slice(4..-1)
    @refresh = refresh
    

  end

  def start

    loop do

      Time.now.strftime("%H%M").chars.each.with_index do |x,i|

        display(x.to_i)
        @digits[i].on
        @segments[7].method( i == 1 ? :off : :on).call
        sleep @refresh
        @digits[i].off

      end

    end

  end

  private

  def display(c)

    lookup = [0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B]
    a = lookup[c].to_s(2).rjust(7,'0').chars.map {|x| x == '1' ? :off : :on}
    a.each.with_index {|x,i| @segments[i].method(x).call}

  end

end

if __FILE__ == $0 then
  Time7Segment.new(*ARGV).start
end
