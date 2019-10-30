# 変更したspecファイルを纏めて実行
# git diff $1 HEAD --name-only | grep spec | grep -v factories.rb | xargs bundle exec rspec spec/

require 'open3'
require 'optparse'

base_branch = ARGV[0] || 'HEAD^'
spec_files, err, s = Open3.capture3("git diff #{base_branch} HEAD --name-only | grep _spec.rb")

unless err.empty?
  p err
  return
end

if spec_files.empty?
  p 'spec files nothing.'
  return
end

puts '##### TEST FILES #####'
puts spec_files

test_tools = 'rspec'
opt = OptionParser.new
opt.on('-z', '--zeus', 'testing by zeus') { test_tools = 'zeus test' }
opt.parse(ARGV)

system "bundle exec #{test_tools} #{spec_files.gsub(/\n/, ' ')}"
