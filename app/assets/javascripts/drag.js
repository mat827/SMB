// ドラッグアンドドロップ
$(function() {
    var el, sortable;
    // getElementByIdで"sortable_list"htmlを取得
    el = document.getElementById("sortable_list");
    token = $('meta[name="csrf-token"]').attr('content');
    if (el !== null) {
      return sortable = Sortable.create(el, {
        delay: 100,
        animation: 150,
        onUpdate: function(evt) {
          // ドラッグ＆ドロップした際に発火
          return $.ajax({
            url: '/users/' + $("#user_id").val() + '/sort',
            type: 'patch',
            data: {
              from: evt.oldIndex,
              to: evt.newIndex
            }
          });
        }
      });
    }
  });
