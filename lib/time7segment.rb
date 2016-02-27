#!/usr/bin/env ruby

require 'rpi'


# file: time7segment.rb

# Quick pin reference
# ===================

# digits:
#
#      digit:  1  2  3  4
#  7 seg pin: 12  9  8  6
#   GPIO pin: 22 27 17 24

# segments:
#
#     index:  0  1  2  3   4   5  6   7
#   segment:  a  b  c  d   e   f  g  dp
# 7 seg pin: 11  7  4  2   1  10  5   3
#  GPIO pin: 11  4 23  8  20  10 18  25

# Hex values used:
#        https://en.wikipedia.org/wiki/Seven-segment_display#Displaying_letters


class Time7Segment

  #                      d1 d2 d3 d4  a b  c d  e  f  g dp
  def initialize(gpio=%w(22 27 17 24 11 4 23 8 20 10 18 25), refresh: 0.0045)

    pins = RPi.new(gpio).pins
    @digits, @segments, @refresh = pins.take(4), pins.slice(4..-1), refresh
    
    a = [0x7E, 0x30, 0x6D, 0x79, 0x33, 0x5B, 0x5F, 0x70, 0x7F, 0x7B]
    
    @numerals = a.map do |x|
      x.to_s(2).rjust(7,'0').chars.map {|x| x == '1' ? :off : :on }
    end
    
  end

  def start

    loop do

      Time.now.strftime("%H%M").chars.each.with_index do |x,i|

        display(x.to_i); @segments[7].method( i == 1 ? :off : :on).call
        @digits[i].on; sleep @refresh; @digits[i].off

      end

    end

  end

  private

  # Displays the segments for an input number between 0-9
  #
  def display(n)

    @numerals[n].each.with_index {|x,i| @segments[i].method(x).call}

  end

end

if __FILE__ == $0 then
  Time7Segment.new(*ARGV).start
end