class RenameColumnSubdominioToSubdomain < ActiveRecord::Migration
  def change
    rename_column :schools, :subdominio, :subdomain
  end
end
