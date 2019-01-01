class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :url, default: 'https://s3-ap-northeast-1.amazonaws.com/there-is/no_image.png', null: false
      t.integer :width, default: 320, null: false
      t.integer :height, default: 320, null: false
      t.references :user, null: false
      t.references :imageable, null: false
      t.string :imageable_type, null: false
      t.timestamps
    end
    
  end
end
