module ViewHelpers
  def data
    d ||= YAML.load_file(File.join(File.dirname(__FILE__), "data.yaml"))
    return d
  end

  def get_thumb(path)
    if path.is_a?(Array)
      path = path[0]
    end
    return "images/portfolio/thumb/#{path}"
  end

  def should_blank(path)
    if path.is_a?(Array)
      return true
    end
    return false
  end

  def get_link(path)
    if path.is_a?(Array)
      return path[1]
    end
    return "images/portfolio/#{path}"
  end

  def work_category(tags)
    categories = {
      "photo" => "Photography",
      "web-design" => "Web Design",
      "code" => "Code",
      "Graphic" => "Graphic",
      "illusration" => "Illusration"
    }

    return categories[tags[0]]
  end

  def work_tags(tags)
    buffer = ""
    tags.each do |tag|
      buffer += "tag-#{tag}"
    end
    return buffer
  end

end
