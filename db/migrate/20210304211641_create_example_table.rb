class CreateExampleTable < ActiveRecord::Migration[5.2]
  def change
    create_table 'examples' do |t|
      t.integer  'status'
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end
  end
end
