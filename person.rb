class Person
  attr_accessor :name, :last_name

  def initialize(params)
    self.name = params[:name]
    self.last_name = params[:last_name]
  end

  def to_s
    "#{name} #{last_name}"
  end

  def self.load_list(raw_people)
    raw_people.map do |raw_person|
      Person.new(raw_person)
    end
  end
end

