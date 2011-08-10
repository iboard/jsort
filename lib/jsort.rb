require "jsort/rails"

module ActionView
  module Helpers
    module FormHelper
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
