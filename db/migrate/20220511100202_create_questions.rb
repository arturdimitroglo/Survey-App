class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :survey, null: false, foreign_key: true
      t.string :question_type

      t.timestamps
    end
  end
end
