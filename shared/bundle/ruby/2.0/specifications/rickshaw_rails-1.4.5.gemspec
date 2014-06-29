# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rickshaw_rails"
  s.version = "1.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Han Kang", "toreriklinnerud", "phillbaker"]
  s.date = "2014-01-08"
  s.description = " Rickshaw, a javascript graphing library based on d3, for the rails asset pipeline "
  s.email = ["han@logicallsat.com"]
  s.homepage = "https://github.com/logical42/rickshaw_rails"
  s.require_paths = ["lib", "app"]
  s.rubygems_version = "2.0.14"
  s.summary = "Gem installation of javascript framework for data visualization, D3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
