
if Rails.env.development? || Rails.env.test? # we may want to seed the test db as well.
  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      Video.create!(url: "https://www.youtube.com/watch?v=SIQihN--98Y")
      Video.create!(url: "https://www.youtube.com/watch?v=Y1PVmANeyAg")
      Video.create!(url: "https://www.youtube.com/watch?v=Zk0ClOGHoXc")
    end
  end
end
