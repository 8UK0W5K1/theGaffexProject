module ApplicationHelper
    def tag_count(article)
        number_approved = article.tags.where(tag_name: "Approved").length
        number_not_approved = article.tags.where(tag_name: "Not Approved").length
        number_need_rewiew = article.tags.where(tag_name: "Need Rewiew").length       
        
        tag_count = {approved: number_approved, not_approved: number_not_approved, need_rewiew: number_need_rewiew}
    end
end
