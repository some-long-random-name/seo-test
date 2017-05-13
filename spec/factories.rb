FactoryGirl.define do
  factory :link do
    title 'Link title'
    slug 'link-title'
    link_group
    page { link_group && link_group.page }
  end

  factory :link_group do
   title 'Group title'
   page
  end

  factory :page do
    title 'Test page'
    slug 'test-page'
  end
end
