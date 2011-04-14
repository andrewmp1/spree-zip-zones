class SpreeZipZonesHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_configurations_menu do
    "<tr>" +
    "<td><%= link_to t('zipcodes'), admin_zipcodes_path %></td>" +
    "<td><%= t('zipcodes_description') %></td>" +
    "</tr>"
  end
end