class CriaSchemaEdools < ActiveRecord::Migration[5.2]
  def change
    create_schema(:edools)
  end
end
