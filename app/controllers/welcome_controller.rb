class WelcomeController < ApplicationController
  require 'net/http'
  require 'open-uri'
  require 'zip'
  def index
  end
  
  
  def update
    file = open('http://data.vancouver.ca/download/kml/kml_road_ahead.zip', 'rb')
    @contents = file.read
    @unzip = unzip_file(file)
  end
  
  def unzip_file (file)
     Zip::File.open(file) do |zippedfile|
      zippedfile.each do |unzipfile|
      end
    end
  end

  

  
  # def unzip_file (file, destination)
  #   Zip::ZipFile.open(file_path) { |zip_file|
  #       zip_file.each { |f|
  #           f_path=File.join("destination_path", f.name)
  #           FileUtils.mkdir_p(File.dirname(f_path))
  #           zip_file.extract(f, f_path) unless File.exist?(f_path)
  #       }
  #   }
  # end
    
  
end
