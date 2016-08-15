class PersonParser
  # vattr_initialize :csv_file_path - requires attr_extras, lub
  # static_facade :run, :csv_file_path - ^^ + PersonParser.run(csv_file_path) => [#<Person>, ...]
  attr_accessor :csv_file_path

  def initialize(csv_file_path)
    self.csv_file_path = csv_file_path
  end

  def people
    raw_people.map { |raw_person| Person.new(raw_person) }
  end

  def raw_people
    @raw_people ||= [].tap do |raw_people|
      CSV.foreach(csv_file_path, :headers => true) do |raw_person|
        raw_people << { name: raw_person['name'], last_name: raw_person['lastname'] }
      end
    end
  end
end

