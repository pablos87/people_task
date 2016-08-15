#!/usr/bin/ruby
require 'csv'
require_relative 'person'
require_relative 'person_parser'

file_paths = ARGV
if file_paths.empty?
  puts 'ArgumentError: at least one csv file path is required'
  exit
end
merged_people = []

file_paths.each do |file_path|
  merged_people += PersonParser.new(file_path).people
end

merged_people.uniq(&:last_name).each { |person| puts person.last_name }

