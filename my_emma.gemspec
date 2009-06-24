# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{my_emma}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jim Remsik", "Sandro Turriate"]
  s.date = %q{2009-06-24}
  s.email = %q{dev@hashrocket.com}
  s.extra_rdoc_files = [
    "README.textile"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "MIT_LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "lib/core_ext.rb",
     "lib/httparty_ext.rb",
     "lib/my_emma.rb",
     "lib/my_emma/response.rb",
     "lib/rfc822.rb",
     "my_emma.gemspec",
     "spec/my_emma/response_spec.rb",
     "spec/my_emma_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/hashrocket/my_emma}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Ruby wrapper for the MyEmma Remote Signup API}
  s.test_files = [
    "spec/my_emma/response_spec.rb",
     "spec/my_emma_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jnunemaker-httparty>, [">= 0.4.3"])
    else
      s.add_dependency(%q<jnunemaker-httparty>, [">= 0.4.3"])
    end
  else
    s.add_dependency(%q<jnunemaker-httparty>, [">= 0.4.3"])
  end
end
