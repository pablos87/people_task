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

puts '>> Imiona:'
merged_people.group_by{ |p| p.name }.each{ |k, v| puts "#{k} (#{v.length})" }
puts '>> Nazwiska:'
merged_people.group_by{ |p| p.last_name }.each{ |k, v| puts "#{k} (#{v.length})" }
