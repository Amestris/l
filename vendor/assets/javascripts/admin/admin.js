var LazyAdmin = {
  setup: function() {

    LazyAdmin.form_tabs_init();
    LazyAdmin.form_customization_init();
    LazyAdmin.form_upload_init();

    $("ul.items-list.sortable li:not(.header)").draggable({
      appendTo: 'body',
      revert: 'invalid',
      cursor: 'move'
    });
    
    $("ul.items-list.sortable li:not(.header)").droppable({
      hoverClass: 'ui-state-hover',
      greedy: true,
      drop: function(event, ui) {
        var object, id, target, target_id, url;

        object = $(ui.draggable);
        id = object.find('input[type=checkbox]').val();

        target = $(this)
        target_id = target.find('input[type=checkbox]').val();
        
        LazyAdmin.show_loader();

        url = $(this).parents('ul.sortable').data('url') + '';

        if (url.indexOf(':id') < 0 || url.indexOf(':target_id') < 0) {
          throw "Element ul.sortable must have data-url. Url has to have :id and :target_id placeholders."
        }

        url = url.replace(':id', id).replace(':target_id', target_id)


        $.post(url, function(data){
          object.insertAfter(target);
        }).fail(function(jqXHR, textStatus) {
          $('#notice').html(jqXHR.responseJSON.join('. '));
          $('#notice').show();
          setTimeout(function() {
            $('#notice').fadeOut(3000);
          }, 3000);
        }).always(function() {
          object.css({
            top: '',
            left: ''
          });
          LazyAdmin.hide_loader();
        });
      }
    });

    if (typeof(LazyAdmin.extension_setup) == "function") LazyAdmin.extension_setup();


  },
  show_loader: function() {
    var loader = $('body > div#lazy-loader')
    if (loader.length == 0) {
      loader = $('<div>')
        .attr('id', 'lazy-loader')
        .css({display: 'none'})
        .appendTo( $('body') )
    }
    loader.fadeIn('fast');
  },
  hide_loader: function() {
    $('body > div#lazy-loader').fadeOut('fast');
  },
  destroy_selected: function(selector, controller) {
    LazyAdmin.action_on_selected(selector, controller, null, 'delete');
  },
  perform_member_action: function(controller, action, id, data) {
    url = '/' + controller + '/' + id;
    if (action != null) url += '/' + action;
    data = $.extend( {
      _method: 'get'
    }, data);
    type = 'get';
    if (data._method != 'get') type = 'post';
    dataType = data.dataType;
    data.dataType = undefined;
    $.ajax({
      url: url,
      dataType: dataType,
      type: type,
      data: data
    });
  },
  perform_collection_action: function(controller, action, data) {
    url = '/' + controller;
    if (action != null) url += '/' + action;
    data = $.extend( {
      _method: 'get'
    }, data);
    type = 'get';
    if (data._method != 'get') type = 'post';
    dataType = data.dataType;
    data.dataType = undefined;
    $.ajax({
      url: url,
      dataType: dataType,
      type: type,
      data: data
    });
  },
  action_on_selected: function(selector, controller, action, _method) {
    if (_method == undefined) {
      method = "get";
      _method = "get"
    }
    var ids = $(selector).filter(':checked').map(function() { return $(this).val() });
    ids.each(function() {
      var _url = controller +'/' + this;
      if (action != null) _url += '/' + action;
      _url += '.js';
      if (_method != "get") {
        method = "post";
      }

      $.ajax({ 
        url: _url,
        dataType: "script",
        type: method,
        data: {
          _method: _method
        }
      });
    });
  },
  form_tabs_init: function() {
    $('.tabs_container').tabs();

    //jezeli jest tylko jedna zakladka, to nie wyswietlamy ul,
    //bo nie ma sensu (szczegolnie przy wersjach jezykowych)
    $('.tabs_container ul').each(function(){
        if ($(this).children('li').length == 1) {
            $(this).css("display", "none");
        }
    });
  },
  form_customization_init: function() {
    $('form select').customSelect();
  },  
  form_upload_init: function() {
    var placeholder = null, form_data = {}, csrf_token = '', csrf_param = '',
      script_path = '', session_key = '', queue_id = '';
    placeholder = $('#upload_photo');

    script_path = placeholder.data('path');
    queue_id = placeholder.find('.queue').attr('id');
    session_key = placeholder.data('cookie-session-key');
    session_value = placeholder.data('cookie-session-value'); 
    form_data[session_key] = session_value;

    csrf_token = $('meta[name=csrf-token]').attr('content');
    csrf_param = $('meta[name=csrf-param]').attr('content');
    form_data[csrf_param] = encodeURI(csrf_token);

    $("#upload_photo .button").uploadify({
      swf: '/assets/uploadify.swf',
      uploader: script_path,
      queueID: queue_id,
      buttonText: 'Wybierz pliki',
      formData: form_data,
      onUploadSuccess: function(file, data) {
        try {
          eval(data);
        } catch (ex) {
          console.log(ex);
        }
      }
    });

  }

}

$(LazyAdmin.setup);
