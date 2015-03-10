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
end
