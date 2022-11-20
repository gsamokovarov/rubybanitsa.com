class CreateSponsorships < ActiveRecord::Migration[6.0]
  def change
    create_table :sponsorships do |t|
      t.belongs_to :event, null: false, foreign_key: true
      t.belongs_to :company, null: false, foreign_key: true
    end
  end
end
