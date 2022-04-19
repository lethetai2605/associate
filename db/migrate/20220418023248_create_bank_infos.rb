class CreateBankInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :bank_infos do |t|
      t.belongs_to :card
      t.string :info

      t.timestamps
    end
  end
end
