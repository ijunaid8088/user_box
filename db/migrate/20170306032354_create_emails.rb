class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.text :body
      t.text :subject
      t.integer :state
      t.integer :head
      t.integer :tail

      t.timestamps
    end
  end
end
