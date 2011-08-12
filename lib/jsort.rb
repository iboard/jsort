require "jsort/rails"

module ActionView
  module Helpers
    module FormHelper
      
      
      
      # Renders an ordered list of items and register the javascript-call for drag-n-sort
      # 
      # @param [Enumerate] items - The collection of items to sort
      # @param [String] name - The name of the div-tag and key of the params for the controller
      # @param [String] path - The path or url to post against (The sort-method in your controller)
      # @param [Hash] options - Options used to format the lines of items
      #
      # Options:
      #   * `:text => 'click here to sort'` - Will use this text as a drag-n-drop-handle instead of the image
      #   * `:image => 'yourimage.jpg'` - use your own image (place it in assets/images path of your application
      #   * `:handle_only => true` - Only the handle (image or text) can be used to drag&move. Default is 'false' which allows you to pick up by clicking anywhere on the line.
      def jsort(items,name,path,options={},&block)
        
        defaults = {
          :handle_only => false,
          :image => 'sortable_vertical.png',
          :text => nil
        }
        defaults.merge!(options)
        concat("<ol id='#{name.pluralize}' path='#{path}'>".html_safe)
        
        begin
          sorted_items = items.sort {|a,b| a.position <=> b.position}
        rescue
          sorted_items = items
        end
        
        for item in sorted_items
          concat("<li class='#{name}_sort_entry' id='#{name}_#{item.to_param}'>".html_safe)
          concat("<span class='handle'>".html_safe)
          if options[:text]
            concat(options[:text] + " ")
          else
            concat(image_tag(defaults[:image], :style => 'box-shadow: none; border-radius: 0;') + " ")
          end
          if defaults[:handle_only] && options[:handle_only] == true
            concat("</span>".html_safe)
          end

          if block_given?
            yield(item)
          else
            concat item.to_s
          end

          unless defaults[:handle_only] && options[:handle_only] == true
            concat("</span>".html_safe)
          end
          concat("</li>".html_safe)
        end
        concat("</ol>".html_safe)
        concat(javascript_tag( "registerSortableList($('##{name.pluralize}'));"))
      end
    end
  end
end
