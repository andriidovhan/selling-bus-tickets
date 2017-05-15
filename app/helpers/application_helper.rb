module ApplicationHelper

  def status_tag(boolean, options={})
    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "desc" ? "asc" : "desc"
    link_to title, :sort => column, :direction => direction
  end
end
