Fabricator(:topic) do
  title { Faker::Lorem.words(1).first }
end

Fabricator(:topic_with_standards, :from => :topic) do
  standards!(:count => 5)
end