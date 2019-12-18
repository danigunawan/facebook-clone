# frozen_string_literal: true

module PostsHelper
    def comment_counter(post)
     post.comments.count  if post.comments.count != 0
    end

    def like_counter(post)
        post.likes.count if post.likes.count != 0
    end

    def display_comments(post)
       post.comments if post.comments.empty? 
    end

    def same(user,post) 
        user == post.creator
    end

    def post_like_buttons(post)
        return unless post.creator == current_user
        link_to 'Edit Post' ,edit_post_path(post)
        
      end

      def post_del_buttons(post)
        return unless post.creator == current_user
        
         link_to 'Delete Post' ,post , method: :delete
      end

      def recent (post)
    return if post.empty?
      'Recent posts by your friends:' 
      end
       def friendly_post(post) 
      post if  post.creator.friend?(current_user)
       end
end
