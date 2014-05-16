class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer_one
      t.string :answer_two
      t.references :user, index: true
      t.references :pool, index: true

      t.timestamps
    end
  end
end
