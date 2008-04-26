require 'rake'

Version = '0.1.2'

begin
  require 'rubygems'
  gem 'echoe', '>=2.7'
  ENV['RUBY_FLAGS'] = ""
  require 'echoe'

  Echoe.new('ambitious-activerecord') do |p|
    p.dependencies  << 'activerecord >=1.15.0'
    p.summary        = "An ambitious adapter for ActiveRecord"
    p.author         = 'Chris Wanstrath'
    p.email          = "chris@ozmm.org"

    p.project        = 'ambition'
    p.url            = "http://ambition.rubyforge.org/"
    p.test_pattern   = 'test/*_test.rb'
    p.version        = Version
    p.dependencies  << 'ambition >=0.5.1'
  end

rescue LoadError 
  puts "Not doing any of the Echoe gemmy stuff, because you don't have the specified gem versions"

  require 'rake/testtask'
  Rake::TestTask.new do |t|
    t.pattern = "test/*_test.rb"
  end
end

desc 'Install as a gem'
task :install_gem do
  puts `rake manifest package && gem install pkg/ambitious-activerecord-#{Version}.gem`
end

task :default => :test 

