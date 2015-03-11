module WelcomeHelper
  def add_constr(type, c_id, title, description, link, published, updated, coords)

    case type
      when "In Progress"
        construct = IpConstruction.new
      when "Upcoming Project"
        construct = UpConstruction.new
      when "Road Closure"
        construct = RcConstruction.new
    end

    if (c_id != "")
      construct.c_id = c_id
      construct.title = title
      construct.description = description
      construct.link = link
      construct.published = published
      construct.updated = updated
      construct.coords = coords
      construct.save
    end

  end

  def retrieve_all(type)

    construct_array = []
    if (type != "")
      case type
        when "In Progress"
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

end
