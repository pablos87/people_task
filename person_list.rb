#!/usr/bin/ruby
require 'csv'
require_relative 'person'
require_relative 'person_parser'

file_path = ARGV[0]
sort_by = ARGV[1]

if file_path.nil?
  puts 'ArgumentError: CSV file path is required'
  exit
end

people_list = PersonParser.new(file_path).people

people_list =
  if sort_by == '--sort-by-name-last_name'
    people_list.sort_by { |person| [person.name, person.last_name] }
  elsif sort_by == '--sort-by-last_name-name'
    people_list.sort_by { |person| [person.last_name, person.name] }
  else
    people_list
  end

people_list.each { |person| puts person }
