class CreateBankSlips < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_slips do |t|
      t.decimal :value
      t.string  :drawee_address
      t.string  :drawee_city
      t.string  :drawee_identification_number
      t.string  :drawee_name
      t.string  :drawee_neighborhood
      t.string  :drawee_state
      t.string  :drawee_zipcode
      t.date    :due_date
      t.integer :status
      t.integer :integration_id


      t.timestamps
    end
  end
end
