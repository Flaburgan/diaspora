# frozen_string_literal: true

module Notifications
  class AlsoCommented < Notification
    include Notifications::Commented

    def mail_job
      Mail::AlsoCommentedWorker
    end

    def popup_translation_key
      "notifications.also_commented"
    end
  end
end
