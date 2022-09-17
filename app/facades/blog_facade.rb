class BlogFacade 

  class << self 

    def all_blogs 
      json = BlogService.get_all_blogs
      json[:data].map do |data|    
        Blog.new(data) 
      end
    end
  end
end