module ButtonsHelper
  def btn(title, url, options = {})
    style = options.delete(:style) || 'primary'
    klass = "btn btn-xs btn-#{style}"

    icon_name = options.delete(:icon)
    icon = content_tag(:span, '', class: "glyphicon glyphicon-#{icon_name}")

    content = "#{icon} #{title}".html_safe

    link_to content, url, options.merge(class: klass)
  end
end
