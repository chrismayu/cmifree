FactoryGirl.define do
  factory :faq do
    title "MyString"
    user_id 1
    admin false
    member_only false
    answer 1
    editor false
    the_answer "MyText"
  end
end
