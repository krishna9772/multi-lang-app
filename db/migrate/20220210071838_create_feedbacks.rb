class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :email
      t.string :role
      t.text :feedback

      t.timestamps
    end
  end
end
