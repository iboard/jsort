/*
   usage registerSortableList($('#sort_syllabus_components'));
   <ul id='sort_syllabus_components'>
     <li>....
   </ul>
*/
function registerSortableList(list) {
  list.sortable(
    {
      connectWith: '.list',
      axis: 'y',
      dropOnEmpty:false,
      handle: '.handle',
      cursor: 'crosshair',
      items: 'li',
      opacity: 0.4,
      scroll: true,
      update: function(){
        var path = list.attr('path');
        $.ajax({
            type: 'post',
            data: list.sortable('serialize'),
            dataType: 'script',
            complete: function(request){
                list.effect('highlight');
              },
            url: path})
      }
    }
  );
  /* list.hide(); */
};
