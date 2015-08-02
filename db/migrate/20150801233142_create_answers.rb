class CreateAnswers < ActiveRecord::Migration
  def change
    remove_column :questions, :answer
    create_table :answers do |t|
      t.text :body
      t.boolean :correct
      t.integer :question_id
      t.timestamps null: false
    end
  end
end
