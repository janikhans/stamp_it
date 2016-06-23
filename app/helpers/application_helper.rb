module ApplicationHelper

  def icon(name, options = {})
    icon_class = "fa fa-#{name.to_s.dasherize}"
    icon_class += " #{options[:class]}" if options.has_key?(:class)
    content_tag :i, nil, class: icon_class
  end

end
