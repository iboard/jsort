jsort
=====

_jsort_ does the javascript/jquery stuff for drag&drop sortable lists in your rails applications.


Usage
-----

**Model**

  Your model should have a 'position'-column of type integer.

**Controller**

```
  def sort
     params[:ordered_items].each_with_index do |id,idx|
       m = MyModel.find(id)
       m.position = idx
       m.save
     end
     render :nothing => true
  end
```

**View** (HAML; obviously, will work with html.erb too)

```
  - jsort(@my_items,'ordered_items', sort_my_controller_path) do |item|
    = item.name
    = link_to "[Edit]", edit_my_item_path(item)
```

This will display an ordered list which is sortable by drag and drop.
The block passed to jsort will be used to format each line. If no block is
given item.to_s will be used to display the items.


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

