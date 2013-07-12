# coding: utf-8
require 'csv'

namespace :unifaun do
  desc 'Import Unifaun partners'
  task import_partners: :environment do

    puts "Deactivated for this version"
    exit

    csv_file = File.expand_path("../../../db/data/partners.csv", __FILE__)
    Spree::Unifaun::Carrier.import_carriers(csv_file) 
  end

  desc "Import Unifaun carrier-services for each carrier"
  task import_carrier_services: :environment do

    puts "Deactivated for this version"
    exit

    errors = []
    Spree::Unifaun::Carrier.all.each do |carrier|
      begin
        carrier.import_carrier_services(carrier.carrier_services_file)
      rescue => e
        errors << e.message
      end
    end
    unless errors.empty?
      puts "Done with errors:"
      errors.map{|e| puts e}
    end
  end

  desc "Import Posten carrier and its services"
  task import_posten: :environment do

    ## Create the carrier for Posten Logistik if it doesn't exist
    carrier = Spree::Unifaun::Carrier.
      where(code: 'PLAB').
      first_or_create(code: 'PLAB', name: 'Posten Logistik AB')

    ## Create services for it
    carrier.import_carrier_services(carrier.carrier_services_file)
  end

end
