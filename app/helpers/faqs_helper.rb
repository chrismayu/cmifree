module FaqsHelper
  
  
  def yes_no(faq)
    
    if faq
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
    
    
  end  
    
  
      def faq_label(faq, member = false)
         html = ""
 
       if faq.member_only?
         html = <<-HTML
         <span class="label label-info sermon_text_small"> <i class="glyphicon glyphicon-unlock"></i> Member's Only</span>
         HTML

        end
        
        if faq.editor?
          html = <<-HTML
          <span class="label label-success sermon_text_small"> <i class="glyphicon glyphicon-unlock"></i> Editor's Only</span>
          HTML

         end
         if faq.admin?
           html = <<-HTML
           <span class="label label-danger sermon_text_small"> <i class="glyphicon glyphicon-unlock"></i> Admin's Only</span>
           HTML

          end


       html.html_safe
     end
     
      
      
      
  
      
  
   
 
  
  
  def faq_markdown(text)
    
    if text !=nil 
    return markdown(text)
  else
    return " empty"
  end
  
  
  end  
    
  
end
