require 'bundler'
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'spec/rake/spectask'

spec = Gem::Specification.new do |s|
  s.name = 'jexp'
  s.version = '0.1.0.pre'
  s.summary = 'a simple library for working with JSON'

  s.files = Dir['lib/**/*']

  bundle = Bundler::Definition.from_gemfile('Gemfile')
  bundle.dependencies.each do |dep|
    next unless dep.groups.include?(:default)
    s.add_dependency(dep.name, dep.version_requirements.to_s)
  end

  s.require_path = 'lib'
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/*_spec.rb']
  t.libs << 'lib'
end
