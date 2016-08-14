module PersonParser
  def parse file_path
    raw_people = []
    begin
      CSV.foreach(file_path, :headers => true) do |raw_person|
        raw_people << { name: raw_person[0], last_name: raw_person[1] }
      end
    rescue Errno::ENOENT => e
      puts "ArgumentError: #{e.message}"
      exit
    else
      raw_people
    end
  end
end

