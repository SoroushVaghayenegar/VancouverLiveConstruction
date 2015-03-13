module WelcomeHelper

  def add_constr(type, c_id, title, description, link, published, updated, coords)

    if ((type != nil) & (c_id != nil) & (title != nil) & (description != nil) & (link != nil) & (published != nil) & (updated != nil) & (coords != nil))
      case type
        when "In Process"
          construct = IpConstruction.new
        when "Upcoming Project"
          construct = UpConstruction.new
        when "Road Closure"
          construct = RcConstruction.new
      end

      construct.c_id = c_id
      construct.title = title
      construct.description = description
      construct.link = link
      construct.published = published
      construct.updated = updated
      construct.coord = coords.to_s.split(" ")
      construct.save
    end


  end

  def retrieve_all(type)

    construct_array = []
    if (type != "")
      case type
        when "In Process"
          construct_array = IpConstruction.all
        when "Upcoming Project"
          construct_array = UpConstruction.all
        when "Road Closure"
          construct_array = RcConstruction.all
      end
    end
    return construct_array

  end

  def delete_IPConstr(c_id)

    if ((c_id != "") & !(IpConstruction.where(:c_id => c_id).blank?))
      IpConstruction.destroy_all(:c_id => c_id)
      @message = "Success"
    else
      @message = "The construction has not been found"
    end

  end

  def delete_UPConstr(c_id)

    if ((c_id != "") & !(UpConstruction.where(:c_id => c_id).blank?))
      UpConstruction.destroy_all(:c_id => c_id)
      @message = "Success"
    else
      @message = "The construction has not been found"
    end

  end

  def delete_RCConstr(c_id)

    if ((c_id != "") & !(RcConstruction.where(:c_id => c_id).blank?))
      RcConstruction.destroy_all(:c_id => c_id)
      @message = "Success"
    else
      @message = "The construction has not been found"
    end

  end

  def reset_db()
    data = retrieve_all("In Process")
    reset_db_helper(data, "In Process")
    data = retrieve_all("Upcoming Project")
    reset_db_helper(data, "Upcoming Project")
    data = retrieve_all("Road Closure")
    reset_db_helper(data, "Road Closure")
  end

  def reset_db_helper(data, type)
    case type
      when "In Process"
        data.each do |d|
          IpConstruction.destroy_all(:id => d.id)
        end
      when "Upcoming Project"
        data.each do |d|
          UpConstruction.destroy_all(:id => d.id)
        end
      when "Road Closure"
        data.each do |d|
          RcConstruction.destroy_all(:id => d.id)
        end
    end
  end

end
