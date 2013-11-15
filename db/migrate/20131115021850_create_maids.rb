class CreateMaids < ActiveRecord::Migration
  def change
    create_table :maids do |t|
      t.column "lat", :decimal, :precision => 15, :scale => 10
      t.column "lng", :decimal, :precision => 15, :scale => 10

      t.timestamps
    end
  end
end
