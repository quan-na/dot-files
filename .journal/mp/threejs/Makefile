DOC=quanna-mp3js.pdf
HTML=vn.quanna.mp3js.viewer.html vn.quanna.mp3js.designer.html
JS=three.min.js vn.quanna.mp3js.viewer.js vn.quanna.mp3js.designer.js
MODEL=vn.quanna.mp3js.model.sample.js vn.quanna.mp3js.model.floorwood.js

all: $(DOC) $(HTML) $(JS) $(MODEL)

clean:
	rm -f *~ vn.quanna.mp3js.*.html vn.quanna.mp3js.*.js quanna-mp3js.*

three.min.js:
	curl http://threejs.org/build/three.min.js | cpif three.min.js

# first call to latex is to get cross reference right
quanna-mp3js.pdf: quanna-mp3js.tex
	latex quanna-mp3js.tex
	pdflatex quanna-mp3js.tex

quanna-mp3js.tex: vn.quanna.mp3js.nw
	noweave -x vn.quanna.mp3js.nw > quanna-mp3js.tex

vn.quanna.mp3js.viewer.html: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.viewer.html vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.viewer.html

vn.quanna.mp3js.designer.html: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.designer.html vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.designer.html

vn.quanna.mp3js.viewer.js: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.viewer.js vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.viewer.js

vn.quanna.mp3js.designer.js: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.designer.js vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.designer.js

vn.quanna.mp3js.model.sample.js: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.model.sample.js vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.model.sample.js

vn.quanna.mp3js.model.floorwood.js: vn.quanna.mp3js.nw
	notangle -Rvn.quanna.mp3js.model.floorwood.js vn.quanna.mp3js.nw | cpif vn.quanna.mp3js.model.floorwood.js
