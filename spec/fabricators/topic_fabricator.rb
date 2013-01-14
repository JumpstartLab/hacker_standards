Fabricator(:topic) do
  title { Faker::Lorem.words(1).first }
  published { true }
end

Fabricator(:topic_with_standards, :from => :topic) do
  standards!(:count => 5){ |parent, s| Fabricate(:standard, :parent => parent) }
end