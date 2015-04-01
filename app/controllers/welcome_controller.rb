class WelcomeController < ApplicationController
  require 'net/http'
  require 'open-uri'
  require 'zip'
  require 'nokogiri'

  before_action :logged_in_user, only: [:map]
  before_action :admin_user,     only: [:update]
  helper_method :update

  include WelcomeHelper
  helper :all

  $last_updated
  def index
    @RC = RcConstruction.all
    @OG = IpConstruction.all
    @FC = UpConstruction.all
    @time = getTime
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

private
# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

# Confirms an admin user.
    def admin_user
      if not current_user.admin? 
        redirect_to(root_url) 
        flash[:danger] = "Sorry! You don't have access"
      end
    end

    def getTime
      if(RcConstruction.any?)
        RcConstruction.first.updated_at.getutc
      else
        "Admin hasn't updated the Database yet!"
      end
    end


end
