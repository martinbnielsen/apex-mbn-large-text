// JavaScript Document

var mbndata = mbndata || {};

mbndata.show_large = function (i) {
	apex.jQuery(i).parent().children('div:first').css('overflow','visible').css('height','');
	
	// Replace Read more with read less
	//apex.jQuery(i).remove();
	apex.jQuery(i).html('Read less');
	apex.jQuery(i).attr('onclick', 'mbndata.show_less(this, "Y");');
}

mbndata.show_less = function (i, t) {
	var it = apex.jQuery(i).parent().children('div:first');
    if (apex.jQuery(it).text() != "") {
      apex.jQuery(it).css("width", apex.jQuery(it).data('mbn-width') + 'px');
      apex.jQuery(it).css("height", apex.jQuery(it).data('mbn-height') + 'px');
      apex.jQuery(it).css("overflow","hidden");
      apex.jQuery(it).css("text-overflow","ellipsis");

	  if (t == "Y") {
  	    apex.jQuery(i).html('Read more...');
  	    apex.jQuery(i).attr('onclick', 'mbndata.show_large(this);');
	  }
	}
}