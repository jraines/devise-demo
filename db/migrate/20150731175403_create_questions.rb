class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.text :answer
      t.integer :quiz_id

      t.timestamps null: false
    end
  end
end
