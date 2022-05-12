class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :title
      t.text :description
      t.text :choice_1
      t.text :choice_2
      t.text :choice_3
      t.text :choice_4
      t.text :choice_5
      t.text :choice_6
      t.text :open_ended_answer
      t.timestamps
    end
  end
end
