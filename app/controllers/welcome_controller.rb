class WelcomeController < ApplicationController
  require 'net/http'
  require 'open-uri'
  require 'zip'
  require 'nokogiri'

  before_action :logged_in_user, only: [:map]

  include WelcomeHelper
  helper :all

  def index
  end

  def map
    @RC = RcConstruction.all
    @OG = IpConstruction.all
    @FC = UpConstruction.all

  end
  
  def about

  end


  def update
    reset_db
    file = "http://vanmapp2.vancouver.ca/georss/roadahead_georss.xml"
    retrieve_and_store(file)
  end

  def retrieve_and_store (file)

    counter = 0
    georss_coord = nil
    xml = Nokogiri::XML(open(file))
    xml.css('entry').each do |d|
      georss_coord = xml.at_css('entry').xpath('//georss:line')[counter].text
      add_constr(d.css('category').first.attribute('term').text, d.at_css('id').text, d.at_css('title').text, d.at_css('content').text, d.at_css('link').attribute('href').text, d.at_css('published').text, d.at_css('updated').text,georss_coord)
      counter += 1
    end
  end


# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
