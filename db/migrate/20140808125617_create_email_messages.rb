class CreateEmailMessages < ActiveRecord::Migration
  def change
    create_table :email_messages do |t|
      t.text :content

      t.timestamps
    end
  end
end
