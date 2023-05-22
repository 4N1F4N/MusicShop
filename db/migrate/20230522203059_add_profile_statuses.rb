class AddProfileStatuses < ActiveRecord::Migration[7.0]
  def change
    ProfileStatus.create(title: "User", access_level: 1)
    ProfileStatus.create(title: "TechStaff", access_level: 2)
    ProfileStatus.create(title: "Admin", access_level: 3)

    Profile.all.each do |profile|
      profile.profile_statuses_id = 1
      profile.save
    end
  end
end
