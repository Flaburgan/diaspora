# frozen_string_literal: true

module Notifications
  class LikedCommentService
    def self.notify(like, _)
      actor = like.author
      target_author = like.target.author

      return unless like.target_type == "Comment" && target_author.local? && actor != target_author

      Notifications::LikedComment
        .concatenate_or_create(target_author.owner, like.target, actor)
        .email_the_user(like, actor)
    end
  end
end
