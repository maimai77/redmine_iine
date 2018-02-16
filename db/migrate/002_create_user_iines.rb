class CreateUserIines < ActiveRecord::Migration::Current
  def change
    create_table :user_iines do |t|
      t.belongs_to :iine_counter
      t.belongs_to :user

      t.timestamps
    end
  end
end
