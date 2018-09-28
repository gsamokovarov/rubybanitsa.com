class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.belongs_to :company, null: false, foreign_key: true
    end
  end
end
