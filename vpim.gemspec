require 'ubygems'
require 'pp'
require 'rake'

spec_vpim = Gem::Specification.new do |s|
  s.author            = "Sam Roberts"
  s.email             = "vieuxtech@gmail.com"
  s.homepage          = "http://vpim.rubyforge.org"
  s.rubyforge_project = "vpim"
  s.name              = "fairtilizer-vpim"
  #s.version           = `ruby stamp.rb`
  s.version           = "0.695"
  s.summary           = "iCalendar and vCard support for ruby (Fork of sam-github/vpim to make it compatible with ruby 1.9 - http://github.com/fairtilizer/vpim)"
  s.description       = <<'---'
This is a pure-ruby library for decoding and encoding vCard and iCalendar data
("personal information") called vPim.
---
  s.has_rdoc          = true
  s.extra_rdoc_files  = ["README", "CHANGES", "COPYING", "samples/README.mutt" ]

  candidates = FileList[
    'lib/vpim/**/*.rb',
    'lib/vpim.rb',
    'bin/*',
    'samples/*',
    'test/test_*.rb',
    'COPYING',
    'README',
    'CHANGES',
  ].to_a

  s.files             = candidates
  s.test_files        = Dir.glob("test/test_*.rb")
  s.executables       = FileList["bin/*"].map{|path| File.basename(path)}

  s.require_path      = "lib"
# s.add_dependency("plist")
# s.autorequire       = "vpim"
end

#pp [spec_vpim, spec_vpim.instance_variables]

spec_vpim_icalendar = Gem::Specification.new do |s|
  s.author            = "Sam Roberts"
  s.email             = "vieuxtech@gmail.com"
  s.homepage          = "http://vpim.rubyforge.org"
  s.rubyforge_project = "vpim"  
  s.name              = "vpim_icalendar"
  s.version           = "1.1"
  s.summary           = "Virtual gem depending on vPim's iCalendar support for ruby"
  s.description       = <<'---'
This is a virtual gem, it exists to depend on vPim, which provides iCalendar
support for ruby. You can install vPim directly.
---
  s.add_dependency("vpim")
end

#require 'hoe'
#
#Hoe.new(spec_vpim.name, spec_vpim.version) do |p|
#  p.rubyforge_name = "vpim"
#  p.remote_rdoc_dir = '' # Release to root
#end
#

if $0==__FILE__
  Gem::Builder.new(spec_vpim).build
  Gem::Builder.new(spec_vpim_icalendar).build
end

