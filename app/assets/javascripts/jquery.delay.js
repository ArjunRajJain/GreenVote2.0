jQuery.fn.delay = function(time,func) {
	return this.each(function(){
		setTimeout(func,time);
	});
};