# frozen_string_literal: true

require_relative 'lib/smart_core/operation/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.10')

  spec.name    = 'smart_operation'
  spec.version = SmartCore::Operation::VERSION
  spec.authors = ['Rustam Ibragimov']
  spec.email   = ['iamdaiver@gmail.com']

  spec.summary     = 'Service Object (Operation, Functional Object, Domain Service)'
  spec.description = 'Smart implementation of the most-used programming pattern - Service Object'
  spec.homepage    = 'https://github.com/smart-rb/smart_operation'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri']
    = spec.homepage
  spec.metadata['source_code_uri']
    = 'https://github.com/smart-rb/smart_operation'
  spec.metadata['changelog_uri']
    = 'https://github.com/smart-rb/smart_operation/blob/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'smart_injection',   '~> 0.1'
  spec.add_dependency 'smart_engine',      '~> 0.7'
  spec.add_dependency 'smart_initializer', '~> 0.2'

  spec.add_development_dependency 'bundler',          '~> 2.1'
  spec.add_development_dependency 'rake',             '~> 13.0'
  spec.add_development_dependency 'rspec',            '~> 3.9'
  spec.add_development_dependency 'armitage-rubocop', '~> 0.87'
  spec.add_development_dependency 'simplecov',        '~> 0.18'
end
