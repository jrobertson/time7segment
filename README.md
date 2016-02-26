# Introducing the time7segment gem


## Connections

Digits:

<pre>
Digit  GPIO
  1     22
  2     27
  3     17
  4     24
</pre>

Segments:

<pre>
    index:  0  1  2  3   4   5  6   7
  segment:  a  b  c  d   e   f  g  dp
7 seg pin: 11  7  4  2   1  10  5   3
 GPIO pin: 11  4 23  8  20  10 18  25
</pre>

## Usage

    require 'time7segment'

    Time7Segment.new(%w(22 27 17 24 11 4 23 8 20 10 18 25)).start

## Output

Here's a quick [video](http://www.jamesrobertson.eu/videos/2016/feb/26/time-on-a-4-digit-7-segment-display.html) of the 4 digit 7 segment display showing the time.


## Resources

* Using a 4 Digit 7 Segment display http://www.jamesrobertson.eu/arduino/2016/feb/25/using-a-4-digit-7-segment-display.html
* time7segment https://rubygems.org/gems/time7segment

rpi raspberrypi gem time 7segment
