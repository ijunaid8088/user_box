class AddCcAndBccToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :cc, :integer, default: [], array: true
    add_column :emails, :bcc, :integer, default: [], array: true
  end
end
