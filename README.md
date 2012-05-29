jsort
=====

_jsort_ does the javascript/jquery stuff for drag&drop sortable lists in your rails applications.


Usage
-----

**Model**

  Your model should have a 'position'-column of type integer.

**Controller**


    def sort
       params[:ordered_items].each_with_index do |id,idx|
         m = MyModel.find(id)
         m.position = idx
         m.save
       end
       render :nothing => true
    end


**View** (HAML; obviously, will work with html.erb too)


    - jsort(@my_items,'ordered_items', sort_my_controller_path) do |item|
      = item.name
      = link_to "[Edit]", edit_my_item_path(item)

_Parameters_

  `jsort ITEMS, NAME, PATH, [OPTIONS]`
  
  * *ITEMS* - a collection of items to sort. If an item provides a method/field positon, the items will be sorted
  * *NAME* - The div-id of the list. This will be the key of `params[:NAME]` passed to the controller.
  * *PATH* - path or url to the controller/action where the script will post to.
  * *OPTIONS* - Opional you may provide the following options:
    * `:text => 'MOVE` - Will use this text as a drag-n-drop-handle instead of the image
    * `:image => 'yourimage.jpg'` - use your own image (place it in assets/images path of your application
    * `:handle_only => true` - Only the handle (image or text) can be used to drag&move. Default is 'false' which allows you to pick up by clicking anywhere on the line.
    * `:register => false` - no call to `registerSortableList($('#list-id')` will be implemented and you have to call the register-function in your own code (eg. coffee-script). Use this strategie if you're using Twitter-Bootstrap and loading the application.js at the end of your layout-file
  


This will display an ordered list which is sortable by drag and drop.
The block passed to jsort will be used to format each line/item. If no block is
given `item.to_s` will be used to display the items.


Installation
------------

 * Rails 3.1:
   * Add `gem "jsort", "~> 0.0.1"` to your Gemfile
   * Add this line to your application.js-template: `//= require jsort_sortable`
 * Rails < 3.1:
   * A generator will be provided soon. At the moment you have to copy the jsort_sortable.js to your javascript-directory and you have to include it in your layout manually.


Contributing to jsort
=====================
 
  * Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
  * Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
  * Fork the project
  * Start a feature/bugfix branch
  * Commit and push until you are happy with your contribution
  * Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
  * Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2011 Andi Altendorfer. See LICENSE.txt for
further details.

