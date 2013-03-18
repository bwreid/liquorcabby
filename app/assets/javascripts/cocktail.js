$(function() {
  $('#new-cocktail-form').hide();
  $('.cocktail-info').on('click', '.foundicon-star', favorite_cocktail);
  resize_window();
  // $('.cocktail-info').hide();
  // $('.cocktail-wrap').on('mouseenter','.image-crop', show_cocktail_recipe);
  // $('.cocktail-wrap').on('mouseenter','.cocktail-info', function(){ return false; });
  // $('.cocktail-wrap').on('mouseleave','.image-crop', cocktail_hide_info);
});

function resize_window() {
  var height = $(window).height();
  $('body').css('min-height', height);
}


/// FAVORITE A COCKTAIL
function favorite_cocktail() {
  if($(this).hasClass('favorited')) {
    $(this).removeClass('favorited');
    var num = $(this).parent().prev().text();
    var newnum = (parseInt(num.replace('Rank: ','')) - 1);
    $(this).parent().prev().text('Rank: ' + newnum);
  } else {
    $(this).addClass('favorited');
    var num = $(this).parent().prev().text();
    var newnum = (parseInt(num.replace('Rank: ','')) + 1);
    $(this).parent().prev().text('Rank: ' + newnum);
  }

}

/// SHOW COCKTAIL DETAILS ON HOVER

function show_cocktail_recipe() {
  var box_height = $(this).parent().height();
  box_height = box_height - (box_height/4);
  $(this).parent().children('img').animate({opacity:0.3}, 'fast');
  $(this).parent().children('.cocktail-info').animate({top:-box_height}, 0, function(){$(this).fadeIn('fast');});
}

function cocktail_hide_info() {
  var box_height = $(this).parent().height();
  box_height = box_height + (box_height/4);
  $(this).parent().children('img').animate({opacity:1}, 'fast');
  $(this).parent().children('.cocktail-info').animate({top:+box_height}, 0, function(){$(this).fadeOut('fast');});
}

/// CLOSE COCKTAIL FORM

function close_new_cocktail_form() {
  $('#new-cocktail-form').slideUp( 400, function() {$('#new-cocktail-form').empty();} );
}

/// AUTOCOMPLETE MAGIC

function autocomplete_ingredient_list(availableTags) {
  var availableTags = eval(availableTags);

  function split( val ) {
    return val.split( /,\s*/ );
  }
  function extractLast( term ) {
    return split( term ).pop();
  }

  $( "#tags" )
    // don't navigate away from the field on tab when selecting an item
    .bind( "keydown", function( event ) {
      if ( event.keyCode === $.ui.keyCode.TAB &&
          $( this ).data( "ui-autocomplete" ).menu.active ) {
        event.preventDefault();
      }
    })
    .autocomplete({
      minLength: 0,
      source: function( request, response ) {
        // delegate back to autocomplete, but extract the last term
        response( $.ui.autocomplete.filter(
          availableTags, extractLast( request.term ) ) );
      },
      focus: function() {
        // prevent value inserted on focus
        return false;
      },
      select: function( event, ui ) {
        var terms = split( this.value );
        // remove the current input
        terms.pop();
        // add the selected item
        terms.push( ui.item.value );
        // add placeholder to get the comma-and-space at the end
        terms.push( "" );
        this.value = terms.join( ", " );
        return false;
      }
    });
};