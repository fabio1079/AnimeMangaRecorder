module ApplicationHelper
  def menu_link text, link
    if params[:controller] == link
      link_to text, "/#{link}", :class=>"btn active"
    else
      link_to text, "/#{link}", :class=>"btn"
    end
  end
end
