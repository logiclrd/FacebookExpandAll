default: expand-all-bookmarklet.js

debug: expand-all-bookmarklet-debug.js
	cp expand-all-bookmarklet-debug.js expand-all-bookmarklet.js

clipboard: default
	xclip -selection c < expand-all-bookmarklet.js

debug-clipboard: debug
	xclip -selection c < expand-all-bookmarklet.js

clean:
	rm expand-all-packed.js expand-all-bookmarklet.js

expand-all-bookmarklet.js: expand-all-packed.js
	printf "javascript:(function(){" > expand-all-bookmarklet.js
	cat expand-all-packed.js >> expand-all-bookmarklet.js
	printf "})();" >> expand-all-bookmarklet.js

expand-all-packed.js: expand-all.js
	uglifyjs --mangle --compress --toplevel expand-all.js > expand-all-packed.js

expand-all-bookmarklet-debug.js: expand-all-packed-debug.js
	printf "javascript:(function(){" > expand-all-bookmarklet-debug.js
	cat expand-all-packed-debug.js >> expand-all-bookmarklet-debug.js
	printf "})();" >> expand-all-bookmarklet-debug.js

expand-all-packed-debug.js: expand-all.js
	uglifyjs --compress --toplevel expand-all.js > expand-all-packed-debug.js

