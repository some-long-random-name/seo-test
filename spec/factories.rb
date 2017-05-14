FactoryGirl.define do
  factory :link do
    title 'Link title'
    search_query 'query'
    link_group
    page { link_group && link_group.page }
  end

  factory :link_group do
   title 'Group title'
   page
  end

  factory :page do
    sequence(:title) { |n|  "Test page #{n}"}
  end
end
