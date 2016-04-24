module DetailsHelper
  
  def ready?(currentuser)
    
    if currentuser.detail.church_name !=nil
      true
    else
      false
    end
  end
  
end
