module ApplicationHelper
    #combine page title with main title
    def full_title(page_title = '')
        main_title = "Bidbook.com"
        if page_title.empty?
            main_title
        else
            page_title + " | " + main_title
        end
    end
    
    #check whether admin or user is signed in
    def someone_signed_in?
        admin_signed_in? || user_signed_in?
    end
    
end
