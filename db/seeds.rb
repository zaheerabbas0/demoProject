10.times do
    Category.create c_name: Faker::Internet.c_name
end
# Product.destroy_all
