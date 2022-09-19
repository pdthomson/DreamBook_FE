class CommentFacade
  class << self

    def all_comments(blog_id)
      json = CommentService.get_all_comments(blog_id)
      json[:data].map do |data|
        Comment.new(data)
      end
    end
  end
end
