module PostCategoriesHelper
    def post_category(id)
        PostCategory.find(id)
    end
end
