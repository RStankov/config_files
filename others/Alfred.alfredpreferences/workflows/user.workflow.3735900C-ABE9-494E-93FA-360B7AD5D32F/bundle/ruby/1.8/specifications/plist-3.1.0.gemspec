# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{plist}
  s.version = "3.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Bleything and Patrick May"]
  s.autorequire = %q{plist}
  s.date = %q{2010-02-23}
  s.description = %q{Plist is a library to manipulate Property List files, also known as plists.  It can parse plist files into native Ruby data structures as well as generating new plist files from your Ruby objects.
}
  s.files = ["test/test_data_elements.rb", "test/test_generator.rb", "test/test_generator_basic_types.rb", "test/test_generator_collections.rb", "test/test_parser.rb"]
  s.homepage = %q{http://plist.rubyforge.org}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{plist}
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{All-purpose Property List manipulation library.}
  s.test_files = ["test/test_data_elements.rb", "test/test_generator.rb", "test/test_generator_basic_types.rb", "test/test_generator_collections.rb", "test/test_parser.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
