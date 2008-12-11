require 'rake'
require 'rake/clean'
require 'rake/gempackagetask'
require 'rake/rdoctask'
require 'rake/testtask'
require 'spec/rake/spectask'

require 'lib/cheap_chronic/version'

NAME = "cheap_chronic"
AUTHOR = "Lance Carlson"
EMAIL = "info@rubyskills.com"
HOMEPAGE = "http://www.rubyskills.com"
SUMMARY = "Simple time parsing"
DESCRIPTION = "Simple time parsing for cheap"

dist_dirs = [ "config", "lib", "spec" ]

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = CChronic::VERSION
  s.platform = Gem::Platform::RUBY
  s.summary = SUMMARY
  s.description = DESCRIPTION
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.has_rdoc = true

  s.add_dependency('rspec')
  s.add_dependency('rake')

  s.files = [ "Rakefile", "README" ]
  dist_dirs.each do |dir|
    s.files = s.files + Dir.glob("#{dir}/**/*")
  end
end

Rake::GemPackageTask.new(spec) do |p|
  p.gem_spec = spec
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'Cheap Chronic'
  rdoc.options << '--line-numbers' << '--inline-source' << '-A cattr_accessor=object'
  rdoc.options << '--charset' << 'utf-8'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run :package and install the resulting .gem'
task :install => :package do
  sh %{sudo gem install pkg/#{NAME}-#{CChronic::VERSION} --no-rdoc --no-ri}
end

desc 'Run :clean and uninstall the .gem'
task :uninstall => [:clean] do
  sh %{sudo gem uninstall #{NAME}}
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
end

desc "Run all specs and generate an rcov report"
Spec::Rake::SpecTask.new('spec:rcov') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  t.rcov = true
  t.rcov_dir = 'coverage'
  t.rcov_opts = ['--exclude', 'gems', '--exclude', 'spec']
end