require 'byebug'
#
# Author: Don Najd
# Date: 3/25/2014
# Inspiration: http://middlemanapp.com/advanced/custom/, https://github.com/middleman/middleman/blob/v3-stable/middleman-core/lib/middleman-more/extensions/directory_indexes.rb
# Usage:
#         in config.rb
#           activate :permalinks
#         in frontmatter
#           permalink: 'foo/bar'

class Permalink < Middleman::Extension


  # Update the main sitemap resource list
  # @return [void]
  def manipulate_resource_list(resources)


    #index_file = app.index_file
    #new_index_path = "/#{index_file}"

    # for each resource
    resources.each do |resource|

      # has permalink in frontmatter
      if resource.respond_to?(:data) and resource.data[:permalink]

        # set path as permalink
        resource.destination_path = resource.data[:permalink] + "index.html"
      end
    end
  end
end

::Middleman::Extensions.register(:permalink, Permalink)
