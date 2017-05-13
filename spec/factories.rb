FactoryGirl.define do
  factory :link do
    
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
