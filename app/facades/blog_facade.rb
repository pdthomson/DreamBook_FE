class BlogFacade

  class << self

    def all_blogs
      json = BlogService.get_all_blogs
      json[:data].map do |data|
        Blog.new(data)
      end
    end

    def user_blogs(current_user_id)
      all_blogs.find_all { |blog| blog.user_id == current_user_id }
    end

    def user_blog(blog_id)
      blog = BlogService.find_blog(blog_id)
      Blog.new(blog[:data])
    end

    def update_blog(blog_params)
      BlogService.revise_blog(blog_params)
    end

  end
end
