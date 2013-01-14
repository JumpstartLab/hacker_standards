Fabricator(:standard) do
  title { Faker::Lorem.sentence }
  parent { Fabricate(:topic) }
end