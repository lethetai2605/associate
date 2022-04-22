class CreateBankInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_infos do |t|
      t.belongs_to :card
      t.string :name
      t.string :open_at
      t.string :branch

      t.timestamps
    end
  end
end
