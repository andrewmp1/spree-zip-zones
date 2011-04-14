require 'spree_core'
require 'spree_zip_zones_hooks'

module SpreeZipZones
  class Engine < Rails::Engine
    
    def self.activate

      # This is mostly copied from the Spree Zone methods,
      # with added support for zipcode zone members
      Zone.class_eval do

        def kind
          member = self.members.last
          case member && member.zoneable_type
          when "State"        then "state"
          when "Zone"         then "zone"
          when "Zipcode"      then "zipcode"
          else
            "country"
          end
        end

        # Check for whether an address.zipcode is available
        def include?(address)
          return false unless address
          debugger
          members.any? do |zone_member|
            case zone_member.zoneable_type
            when "Zone"
              zone_member.zoneable.include?(address)
            when "Country"
              zone_member.zoneable == address.country
            when "State"
              zone_member.zoneable == address.state
            when "Zipcode"
              zone_member.zoneable.name == address.zipcode
            else
              false
            end
          end
        end

      end # Zone

      Admin::ZonesController.class_eval do

        def load_data
          @countries = Country.all.sort
          @states = State.all.sort
          @zipcodes = Zipcode.all.sort
          @zones = Zone.all.sort
        end

      end # Admin::ZonesController
      
    end

    config.to_prepare &method(:activate).to_proc
  end
end
