default: expand-all-bookmarklet.js

clean:
	rm expand-all-packed.js expand-all-bookmarklet.js

expand-all-bookmarklet.js: expand-all-packed.js
	printf "javascript:(function(){" > expand-all-bookmarklet.js
	cat expand-all-packed.js >> expand-all-bookmarklet.js
	printf "})();" >> expand-all-bookmarklet.js

expand-all-packed.js: expand-all.js
	uglifyjs --mangle --compress --toplevel expand-all.js > expand-all-packed.js
