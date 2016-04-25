module EventSubmissionsHelper
  
  def time_email(time)
    time.strftime("%H:%M")  
  end
  
  def date_email(date)
    date.strftime("%B %e, %Y")  
  end
  
  def if_yes_or_no(item)
 
    if item == true
      "Yes"
    else
      "No"
    end
  end
end
