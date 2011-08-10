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
     dome code here
  end
```

**View**

```
  jsort(@items,'people',sort_people_path)
```




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

