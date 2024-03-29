module ApplicationHelper
  def markdown(text)
    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true,
      no_intra_emphasis:  true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def flash_class(level)
    case level
    when "notice" then "alert alert-info"
    when "error" then "alert alert-danger"
    when "alert" then "alert alert-warning"
    else "alert alert-#{level}"
    end
  end
end
