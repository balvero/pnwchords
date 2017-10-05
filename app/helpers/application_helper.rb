module ApplicationHelper
  def nav_items
    [
        {
            url: songs_path,
            title: 'Songs'
        },
        {
            url: artists_path,
            title: 'Artist'
        },


    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "  <#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>
      "
    end

    nav_links.html_safe

  end


  def active? path
    "active" if current_page? path
  end


  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-error"
      when 'alert'
        "alert-warning"
      when 'notice'
        "alert-info"
      else
        flash_type
    end
  end


end
