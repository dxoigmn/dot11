Gem::Specification.new do |s|
  s.authors       = ['Cory T. Cornelius']
  s.email         = ['cory.t.cornelius@dartmouth.edu']
  s.name          = 'dot11'
  s.version       = '0.1.0'
  s.date          = '2008-08-02'
  s.summary       = 'Simple 802.11 packet parser.'
  s.homepage      = 'http://github.com/dxoigmn/dot11'
  s.description   = 'See README.markdown for more information.'
  s.files         = [ 'README.markdown',
                      'lib/dot11.rb',
                      'lib/dot11/dot11.rb',
                      'lib/dot11/macaddress.rb',
                      'lib/dot11/packet.rb',
                      'lib/dot11/packetset.rb',
                      'lib/dot11/radiotap.rb',
                      'lib/dot11/raw.rb',
                      'tests/dot11_test.rb' ]
  s.require_paths = [ 'lib' ]
end
