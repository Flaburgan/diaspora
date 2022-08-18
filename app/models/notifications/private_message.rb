# frozen_string_literal: true

module Notifications
  class PrivateMessage < Notification
    def mail_job
      Mail::PrivateMessageWorker
    end

    def popup_translation_key
      "notifications.private_message"
    end
  end
end
