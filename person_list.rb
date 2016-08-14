#!/usr/bin/ruby
require 'csv'
require_relative 'person'
require_relative 'person_parser'

include PersonParser

file_path = ARGV[0]
sort_by = ARGV[1]

if file_path.nil?
  puts 'ArgumentError: CSV file path is required'
  exit
end

raw_people = PersonParser.parse(file_path)
people_list = Person.load_list(raw_people)

if sort_by == '--sort-by-name-last_name'
  people_list.sort! { |a, b| "#{a.name} #{a.last_name}" <=> "#{b.name} #{b.last_name}" }
elsif sort_by == '--sort-by-last_name-name'
  people_list.sort! { |a, b| "#{a.last_name} #{a.name}" <=> "#{b.last_name} #{b.name}" }
end

people_list.each { |person| puts person }
