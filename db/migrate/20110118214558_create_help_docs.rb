class CreateHelpDocs < ActiveRecord::Migration

  def self.up
    create_table :help_docs do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps
    end

    add_index :help_docs, :id

    load(Rails.root.join('db', 'seeds', 'help_docs.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "help_docs"})

    Page.delete_all({:link_url => "/help_docs"})

    drop_table :help_docs
  end

end
