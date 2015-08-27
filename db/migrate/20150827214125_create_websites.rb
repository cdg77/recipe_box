class CreateWebsites < ActiveRecord::Migration
  def change
    create_table(:websites) do |t|
      t.column(:address, :string)
      t.column(:recipe_id, :int)

      t.timestamps()
    end
  end
end
