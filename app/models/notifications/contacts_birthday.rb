# frozen_string_literal: true

module Notifications
  class ContactsBirthday < Notification
    def mail_job
      Mail::ContactsBirthdayWorker
    end

    def popup_translation_key
      "notifications.contacts_birthday"
    end
  end
end
