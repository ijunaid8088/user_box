class AddCcAndBccToEmails < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :cc, :integer
    add_column :emails, :bcc, :integer
  end
end
