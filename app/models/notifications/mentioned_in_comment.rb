# frozen_string_literal: true

module Notifications
  class MentionedInComment < Notification
    include Notifications::Mentioned

    def popup_translation_key
      "notifications.mentioned_in_comment"
    end

    def deleted_translation_key
      "notifications.mentioned_in_comment_deleted"
    end

    def mail_job
      if NotificationSettingsService.new(recipient).email_enabled?(:mentioned_in_comment)
        Mail::MentionedInCommentWorker
      elsif shareable.author.owner_id == recipient_id
        Mail::CommentOnPostWorker
      elsif shareable.participants.local.where(owner_id: recipient_id)
        Mail::AlsoCommentedWorker
      end
    end

    private

    def shareable
      linked_object.parent
    end
  end
end
