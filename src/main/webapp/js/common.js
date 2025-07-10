// JavaScript Document

$(document).ready(function() {
	
	/* LNB */	
	$('.btMenu').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$('.lnb').removeClass('hide');
			navTrue = true;
		} else {
			$(this).addClass('on');
			$('.lnb').addClass('hide');
			navTrue = false;
		}
	});
	$('.menu.more').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$(this).next('.subMenu').slideUp();
		} else {
			$(this).addClass('on');
			$(this).next('.subMenu').slideDown();
		}
	});
	
	
	$(function(){
		
		$('.popBox').draggable({cancel : '.conBody'}); //conhead로만 드래그 가능
		
		/* DATE PICKER */
		$('.input.date').datepicker({
			dateFormat: "yy-mm-dd"
		});
		$('.calendar').datepicker({
			dateFormat: "yy-mm-dd",
			monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
		});
		/*
		$.datepicker.setDefaults({
			dateFormat: 'yyyy-mm-dd',
			monthNames: ['01','02','03','04','05','06','07','08','09','10','11','12'],
			dayNamesMin: ['일','월','화','수','목','금','토'],
			showMonthAfterYear: true,
		});
		
		/* RESIZE */
		$('.resize.x').resizable({
			handles: "e"
		});
		$('.resize.y').resizable({
			handles: "s"
		});

		/* Autocomplete select */
		$.widget( "custom.combobox", {
				_create: function() {
				this.wrapper = $( "<label>" )
				//.addClass( "custom-combobox" )
				.insertAfter( this.element );

				this.element.hide();
				this._createAutocomplete();
				this._createShowAllButton();
			},

			_createAutocomplete: function() {
				var selected = this.element.children( ":selected" ),
				value = selected.val() ? selected.text() : "";

				this.input = $( "<input>" )
				.appendTo( this.wrapper )
				.val( value )
				//.attr( "title", "" )
				//.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
				.autocomplete({
					delay: 0,
					minLength: 0,
					source: $.proxy( this, "_source" )
				})
				.tooltip({
					classes: { "ui-tooltip": "ui-state-highlight" }
				});

				this._on( this.input, {
					autocompleteselect: function( event, ui ) {
						ui.item.option.selected = true;
						this._trigger( "select", event, {
							item: ui.item.option
						});
					},
					autocompletechange: "_removeIfInvalid" 
				});
			},

			_createShowAllButton: function() {
				var input = this.input,
				wasOpen = false;

				$( "<a>" )
				.attr( "tabIndex", -1 )
				//.attr( "title", "Show All Items" )
				.tooltip()
				.appendTo( this.wrapper )
				.button({
					icons: {
						primary: "ui-icon-triangle-1-s"
					},
					text: false
				})
				.removeClass( "ui-corner-all" )
				.addClass( "custom-combobox-toggle" )
				.on( "mousedown", function() {
					wasOpen = input.autocomplete( "widget" ).is( ":visible" );
				})
				.on( "click", function() {
					input.trigger( "focus" );

					// Close if already visible
					if ( wasOpen ) { return; }
					
					// Pass empty string as value to search for, displaying all results
					input.autocomplete( "search", "" );
				});
			},

			_source: function( request, response ) {
				var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
				response( this.element.children( "option" ).map(function() {
					var text = $( this ).text();
					if ( this.value && ( !request.term || matcher.test(text) ) )
					return {
						label: text,
						value: text,
						option: this
						};
					})
				);
			},

			_removeIfInvalid: function( event, ui ) {
				// Selected an item, nothing to do
				if ( ui.item ) { return; }

				// Search for a match (case-insensitive)
				var value = this.input.val(),
				valueLowerCase = value.toLowerCase(),
				valid = false;
				this.element.children( "option" ).each(function() {
					if ( $( this ).text().toLowerCase() === valueLowerCase ) {
						this.selected = valid = true;
						return false;
					}
				});
				
				// Found a match, nothing to do
				if ( valid ) { return; }
					// Remove invalid value
					this.input
					.val( "" )
					//.attr( "title", value + " didn't match any item" )
					.tooltip( "open" );
					this.element.val( "" );
					this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
					this.input.autocomplete( "instance" ).term = "";
			},
			_destroy: function() {
				this.wrapper.remove();
				this.element.show();
			}
		});

		$('select.auto').combobox();
	});
	
	/* NAV *
	$('.btMenu').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$('.lnb.nav'+depth1).removeClass('hide');
			$('article.content').removeClass('wide');
		} else {
			$(this).addClass('on');
			$('.lnb.nav'+depth1).addClass('hide');
			$('article.content').addClass('wide');
		}		
	});
	*/
	
	/* SELECT */
    $('select').change(function(){
        var selectText = $(this).children('option:selected').text();
        $(this).siblings('label').text(selectText);
    });
	$('.select > label').click(function(){
		$(this).toggleClass('on');
		$(this).siblings('.option').toggle();
	});
	
	/* COLOR *
    $('input[type="color"]').change(function(){
        var selectColor = $(this).val();
        $(this).siblings('label').text(selectColor);
		$(this).siblings('i').css("background-color", selectColor);
    });
	
	/* TAP */
	$('.tap li').click(function(){
		$(this).siblings('li').removeClass('on');
		$(this).addClass('on');
		var index = $(this).index()+1;
		$(this).parents('.tap').siblings('.tapCon').addClass('hide');
		$(this).parents('.tap').siblings('.tapCon.view'+ index).removeClass('hide');
	});
	
	
	/* BT SOUND */
	$('.btSound').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
		} else {
			$(this).addClass('on');
		}		
	});
	
	
	/* POPUP CLOSE */
	$('.popup .btClose').click(function(){
		$(this).parents('.popup').addClass('hide');
	});
	
//	var target = $('.popBox');
//	$('.popup').mouseup(function (e){
//		if(target.has(e.target).length==0) {
//			$('.popup').addClass('hide');
//		} 
//	});
//	window.onkeyup = function(e) {
//		var key = e.keyCode ? e.keyCode : e.which;
//		if(key == 27) {
//			$('.popup').addClass('hide');
//		}
//	}

	
	
	/* REAL TIME CHECK */	
	$('.realTime').click(function(){
		/*
		if ($('#realCHK').is(':checked')) {
			$('.search').addClass('hide');
			$('.grid').find('.sorter').addClass('hide');
			$('.realTime').find('.txt').addClass('on');
		} else {
			$('.search').removeClass('hide');
			$('.grid').find('.sorter').removeClass('hide');
			$('.realTime').find('.txt').removeClass('on');
		}
		*/
	});
	
	
	/* BT COLUMN */	
	$('.btColumn').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$('.column').addClass('hide');
		} else {
			$(this).addClass('on');
			$('.column').removeClass('hide');
		}
	});
	
	/* COLUMN */	
	$('.column li').click(function(){
		$(this).toggleClass('off');
	});
	
	
	/* GRID RANGE */	
	$('.range').click(function(){
		$(this).toggleClass('on');
	});
	
	
	
	
	/* NODE, VIEW */
	$('.btData').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$(this).siblings('.info').hide();
		} else {
			$(this).addClass('on');
			$(this).siblings('.info').show();
		}		
	});
	
	/* BT SORT */
	$('.btSort').click(function(){
		if ($(this).hasClass('on')) {
			$(this).removeClass('on');
			$('.node, .view').removeClass('hide');
		} else {
			$(this).addClass('on');
			$('.node, .view').addClass('hide');
		}		
	});
	
	
})