class AddVerificationToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :verification, :boolean, default: false
  end
end
