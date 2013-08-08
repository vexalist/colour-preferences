#! /usr/bin/ruby

dir = "#{Dir.pwd}/#{ARGV[0]}"
template = File.dirname(__FILE__)

`cp -r #{template} #{dir}`
`rm -rf #{dir}/.git`
`cd #{dir} && git init`
