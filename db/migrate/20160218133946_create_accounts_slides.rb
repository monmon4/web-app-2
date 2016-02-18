class CreateAccountsSlides < ActiveRecord::Migration
  def change
    create_table :accounts_slides, id: false do |t|
      t.references :account, index: true, foreign_key: true
      t.references :slide, index: true, foreign_key: true
    end
  end
end
