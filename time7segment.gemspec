Gem::Specification.new do |s|
  s.name = 'time7segment'
  s.version = '0.1.2'
  s.summary = 'Displays the time on a 4 digit 7 segment display connected to a Raspberry Pi.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/time7segment.rb']
  s.add_runtime_dependency('rpi', '~> 0.4', '>=0.4.5')
  s.signing_key = '../privatekeys/time7segment.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@r0bertson.co.uk'
  s.homepage = 'https://github.com/jrobertson/time7segment'
end
