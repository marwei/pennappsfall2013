jQuery(document).ready(function(){
	$(".container").masonry({
		itemSelector: '.card'
	});
	$('.typeahead').typeahead({
	name: 'adsb',
	local: ['apl','asterisk','clike','clojure','cobol','coffeescript','commonlisp','css','d','diff','ecl','erlang','gas','gfm','go','groovy','haml','haskell','haxe','htmlembedded','htmlmixed','http','jade','javascript','jinja2','less','livescript','lua','markdown','mirc','nginx','ntriples','ocaml','pascal','perl','php','pig','properties','python','q','r','rpm','rst','ruby','rust','sass','scheme','shell','sieve','smalltalk','smarty','smartymixed','sparql','sql','stex','tcl','tiddlywiki','tiki','turtle','vb','vbscript','velocity','verilog','xml','xquery','yaml','z80']
	});



});