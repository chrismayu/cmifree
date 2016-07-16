class Faq < ActiveRecord::Base
  scope :everyone, -> { where(member_only: false).where(editor: false).where(admin: false) }
  scope :member, -> { where(editor: false).where(admin: false) }
  scope :editor, -> {where(admin: false).where(editor: true)}
  scope :admin, -> {all}
   
end
