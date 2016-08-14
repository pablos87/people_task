#!/usr/bin/ruby
require 'csv'
require_relative 'person'
require_relative 'person_parser'

include PersonParser

file_paths = ARGV
if file_paths.empty?
  puts 'ArgumentError: at least one csv file path is required'
  exit
end
merged_people = []

file_paths.each do |file_path|
  raw_people = PersonParser.parse(file_path)
  merged_people.push(*Person.load_list(raw_people))
end

merged_people.uniq{ |p| p.last_name }.each { |person| puts person.last_name }

