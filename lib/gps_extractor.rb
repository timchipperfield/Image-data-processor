class GPSExtractor

  attr_reader :filename

  def initialize filename
    @filename = filename
  end

  def extract_data
    data = Exif::Data.new(File.open(filename))
    make_gps_hash data
  end

  private

  def make_gps_hash data
    hash = Hash.new
    hash[:lat] = get_lat data ||= nil
    hash[:lng] = get_lng data ||= nil
    hash[:filename] = File.basename(filename)
    hash
  end

  def get_lat data
    if data.gps_latitude
      degrees_lat = data.gps_latitude[0].to_i
      minutes_lat = data.gps_latitude[1].to_f / 60
      seconds_lat = data.gps_latitude[2].to_f / 3600
      degrees_lat + minutes_lat + seconds_lat
    end
  end

  def get_lng data
    if data.gps_longitude
      degrees_lng = data.gps_longitude[0].to_i
      minutes_lng = data.gps_longitude[1].to_f / 60
      seconds_lng = data.gps_longitude[2].to_f / 3600
      degrees_lng + minutes_lng + seconds_lng
    end
  end
end
