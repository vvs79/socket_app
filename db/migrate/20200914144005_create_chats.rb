class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :name

      t.timestamps
    end
    add_index :chats, :name, unique: true
  end
end
