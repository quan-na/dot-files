all: vn.quanna.mp.main.js vn.quanna.mp.render.tex

vn.quanna.mp.main.js: vn.quanna.mp.render.nw
	notangle -Rvn.quanna.mp.main.js vn.quanna.mp.render.nw > vn.quanna.mp.main.js

vn.quanna.mp.render.tex: vn.quanna.mp.render.nw
	noweave -x vn.quanna.mp.render.nw > vn.quanna.mp.render.tex

clean:
	rm vn.quanna.mp.main.js
	rm vn.quanna.mp.render.tex
