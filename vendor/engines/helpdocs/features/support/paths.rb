module NavigationHelpers
  module Refinery
    module Helpdocs
      def path_to(page_name)
        case page_name
        when /the list of helpdocs/
          admin_helpdocs_path

         when /the new helpdoc form/
          new_admin_helpdoc_path
        else
          nil
        end
      end
    end
  end
end
