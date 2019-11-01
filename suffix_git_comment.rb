# git commentにチケット番号を自動付与するスクリプト

require 'open3'
require 'optparse'

branch, err, s = Open3.capture3('git rev-parse --abbrev-ref HEAD')

unless err.empty?
  p err
  return
end

branch.chomp!.slice!('ticket/')
unless  branch.match?(/^[+-]?[0-9]+$/)
  p '対象外のブランチ名です'
  return
end

if ARGV[0].nil?
  p 'コメントを入力してください'
  return
end

comment = ARGV[0] + "(##{branch})"
system("git commit -m \"#{comment}\"")
