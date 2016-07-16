module ApplicationHelper
  
  
  
  def site_open?
  
  
  end
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  
  # Returns the full title on a per-page basis.       # Documentation comment
  def full_title(page_title)                          # Method definition
    base_title = "Life Church"  # Variable assignment
    page = page_title.to_s.html_safe
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      "#{base_title} | #{page_title}"                 # String interpolation
    end
  end


  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
 
  
  def placeholder_image_url(size="200x150", *args)
    options = args.extract_options!
    # If fg is present, bg is required (and vice versa)
    options[:bg] = "F0F0F5" if options[:fg].present? && options[:bg].blank?	
    options[:fg] = "ff69b4" if options[:bg].present? && options[:fg].blank?
    options[:bg] = "F0F0F5"
    parts = []
    parts << "http://placehold.it"
    parts << "/#{size}"
    parts << "/#{options[:bg]}" if options[:bg].present?
    parts << "/#{options[:fg]}" if options[:fg].present?
    parts << "&text=#{options[:text]}" if options[:text].present?
    parts.join ""
  end
  
  def markdown(text)
     renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
     options = {
       autolink: true,
       no_intra_emphasis: true,
       fenced_code_blocks: true,
       lax_html_blocks: true,
       strikethrough: true,
       superscript: true
     }
     Redcarpet::Markdown.new(renderer, options).render(text).html_safe
   end
   

  
  
end
