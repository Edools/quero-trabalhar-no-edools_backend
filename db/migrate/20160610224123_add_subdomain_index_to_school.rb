class AddSubdomainIndexToSchool < ActiveRecord::Migration
  def change
    add_index :schools, :subdomain, unique: true
  end
end
