class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    #create_table prob function that takes in name of table, and closure that returns an object implicitly that takes in the key-value pairs we defined.
    create_table :articles do |t|
      t.string :title
      t.text :body

      #this is a method that defines two more columns named created_at and updated_at. 
      t.timestamps
    end
  end
end
