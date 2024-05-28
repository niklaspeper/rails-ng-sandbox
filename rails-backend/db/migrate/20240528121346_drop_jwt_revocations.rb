class DropJwtRevocations < ActiveRecord::Migration[7.1]
  def change
    drop_table :jwt_revocations
  end
end
