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

puts '>> Imiona:'
merged_people.each_with_object(Hash.new(0)){ |person, hsh| hsh[person.name] = hsh[person.name] + 1 }.each{ |k, v| puts "#{k} (#{v})" }
puts '>> Nazwiska:'
merged_people.each_with_object(Hash.new(0)){ |person, hsh| hsh[person.last_name] = hsh[person.last_name] + 1 }.each{ |k, v| puts "#{k} (#{v})" }

