class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.string :title #titleのカラムを追加
      t.string :body #bodyカラムを追加
      t.timestamps
    end
  end
end
