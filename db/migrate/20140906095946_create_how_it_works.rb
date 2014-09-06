class CreateHowItWorks < ActiveRecord::Migration
  def change
    create_table :how_it_works do |t|
      t.text :heading
      t.text :line1
      t.text :line2
      t.text :line3
      t.text :line4
      t.text :line5

      t.timestamps
    end
  end
end
