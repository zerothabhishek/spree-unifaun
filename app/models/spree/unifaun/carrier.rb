class Spree::Unifaun::Carrier < ActiveRecord::Base
  self.table_name = :spree_unifaun_carriers

  #belongs_to :carrier_service, class_name: 'Spree::Unifaun::CarrierService'
  has_many :carrier_services, class_name: 'Spree::Unifaun::CarrierService', dependent: :destroy

  attr_accessible :code, :name
  validates :code, :name, presence: true

  def self.import_carriers(csv_file_path)
    require 'csv'
    CSV.foreach(csv_file_path, col_sep:';') do |row|
      Spree::Unifaun::Carrier.
        where(code: row[0]).
        first_or_create(code: row[0], name: row[1]).
        save
    end    
  end

  ## Imports carrier-services data from the given file
  def import_carrier_services(csv_file_path)
    require 'csv'
    self.carrier_services.clear
    CSV.foreach(csv_file_path, col_sep:';', headers: true) do |row|
      self.carrier_services.create(code: row[0], service: row[1])
    end
  end

  ## Gives the file path for the carrier-services file: db/data/#{code}.csv
  def carrier_services_file
    root_path = File.expand_path("../../../../../", __FILE__)
    File.join(root_path, "db", "data", "#{code.downcase}.csv")    
  end

end
