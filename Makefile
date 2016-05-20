.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	digicore-wallet-client.min.js

clean:
	rm digicore-wallet-client.js
	rm digicore-wallet-client.min.js

digicore-wallet-client.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

digicore-wallet-client.min.js: digicore-wallet-client.js
	${BIN_PATH}uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
