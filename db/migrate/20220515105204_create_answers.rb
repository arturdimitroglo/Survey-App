class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.boolean :choice_1
      t.boolean :choice_2
      t.boolean :choice_3
      t.boolean :choice_4
      t.boolean :choice_5
      t.boolean :choice_6
      t.string :multiple_answer_choice
      t.text :open_ended_answer

      t.timestamps
    end
  end
end
