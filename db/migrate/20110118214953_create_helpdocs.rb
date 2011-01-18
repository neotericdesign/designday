class CreateHelpdocs < ActiveRecord::Migration

  def self.up
    create_table :helpdocs do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end

    add_index :helpdocs, :id

    load(Rails.root.join('db', 'seeds', 'helpdocs.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "helpdocs"})

    Page.delete_all({:link_url => "/helpdocs"})

    drop_table :helpdocs
  end

end
