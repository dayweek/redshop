
function add_to_cart_effect (id) {
  target = $('cart_target');
//   var left = cart.getStyle('left');
//   var top = cart.getStyle('top');
  var source = $(id)
  var clone = source.cloneNode(true);
  clone.setAttribute ('id','clone');
  $(document.body).insert({top: clone});
  clone.setStyle({'zIndex': '1000'});
  clone.setStyle({'position': 'absolute'});
  clone.setStyle ('top',source.getStyle('top'));
  clone.setStyle ('left',source.getStyle('left'));
  clone.show();
  clone.morph('opacity: 0.0; left: ' + target.getStyle('left') + '; top: ' + target.getStyle('top') + ', afterFinish: add_to_cart_effect_clear');
}

function add_to_cart_effect_clear () {
  $('clone').remove();
}

function add_to_cart_effect_clear_jquery () {
  jQuery('#clone_' + id).remove();
}

clone_id = 0;

function add_to_cart_effect_jquery (id) {
      var source = jQuery('#' + id );
      var target = jQuery('#cart_target');
      topc =  target.offset().top - source.offset().top;
      leftc =  target.offset().left - source.offset().left;
      var img = source.clone();
      jQuery('body').prepend(img);
      
/*      var shadow = $('#' + source_id + '_shadow');
      if( !shadow.attr('id') ) {
          $('body').prepend('<div id="'+source.attr('id')+'_shadow" style="display: none; background-color: #ddd; border: solid 1px darkgray; position: static; top: 0px; z-index: 100000;">&nbsp;</div>');
          var shadow = $('#'+source.attr('id')+'_shadow');
      }
      
      if( !shadow ) {
          alert('Cannot create the shadow div');
      }
      
      shadow.width(source.css('width')).height(source.css('height')).css('top', source.offset().top).css('left', source.offset().left).css('opacity', 0.5).show();
      shadow.css('position', 'absolute');
  */    
//       img.css('position', 'static');
      var perm_clone_id = clone_id;
      clone_id = clone_id + 1;
      img.css('zIndex', '100000');
      img.width(source.css('width')).height(source.css('height')).css('opacity', 0.5);
      img.css('position', 'absolute');
      img.css('left', source.offset().left).css('top',source.offset().top);
      img.attr('id','clone_' + perm_clone_id);
      img.show();
//       alert (img.css('top') + ' '  + ' ' + img.css('left'));
      img.animate( { top: target.offset().top, left: target.offset().left, opacity: 0}, { duration: 2000, complete: function add_to_cart_effect_clear_jquery() {
        jQuery('#clone_' + perm_clone_id).remove();} })
        
}

function add_to_cart_effect_jquery2 (id) {

    
      var source = jQuery('#' + id );
      var target = jQuery('#cart_target' );

      
      var shadow = jQuery('#' + id + '_shadow');
      if( !shadow.attr('id') ) {
          jQuery('body').prepend('<div id="'+source.attr('id')+'_shadow" style="display: none; background-color: #ddd; border: solid 1px darkgray; position: static; top: 0px; z-index: 100000;">&nbsp;</div>');
          var shadow = jQuery('#'+source.attr('id')+'_shadow');
      }
      
      if( !shadow ) {
          alert('Cannot create the shadow div');
      }
      
      shadow.width(source.css('width')).height(source.css('height')).css('top', source.offset().top).css('left', source.offset().left).css('opacity', 0.5).show();
      shadow.css('position', 'absolute');
      
      shadow.animate( { top: target.offset().top, left: target.offset().left }, { duration: 300 } )
        .animate( { opacity: 0 }, { duration: 100, complete: add_to_cart_effect_clear_jquery(id) } );
        
		}

