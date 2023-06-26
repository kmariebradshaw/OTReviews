require 'csv'

class Product < ApplicationRecord
  has_many :reviews
  belongs_to :category

    def self.to_csv
    CSV.generate do |csv|
      csv << %w{ title id } 
      all.each do |product|
        csv << [product.title, product.id]
      end
    end
  end
end
