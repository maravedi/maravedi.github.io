Gem::Specification.new do |s|
  s.name          = 'jekyll-theme-architect'
  s.version       = '0.1.1'
  s.license       = 'CC0-1.0'
  s.authors       = ['Jason Long', 'GitHub, Inc.']
  s.email         = ['opensource+jekyll-theme-architect@github.com']
  s.homepage      = 'https://github.com/pages-themes/architect'
  s.summary       = 'Architect is a Jekyll theme for GitHub Pages'

  s.files         = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end

  s.platform = Gem::Platform::RUBY
  s.add_runtime_dependency 'jekyll', '~> 3.9.1'
  s.add_runtime_dependency 'jekyll-seo-tag', '~> 2.7'
  s.add_runtime_dependency 'kramdown', '>= 2.3.1'
  s.add_runtime_dependency 'kramdown-parser-gfm',   '~> 1.0.1'
  s.add_development_dependency 'html-proofer', '~> 3.19'
  s.add_development_dependency 'rubocop', '~> 1.16'
  s.add_development_dependency 'w3c_validators', '~> 1.3'
end
