#!/bin/bash
#
mkdir -p bundle

# remove the installed moment modules
rm -r node_modules/moment*
# install moment first, moment-timezone second
npm install moment@2.10.6
npm install moment-timezone@0.4.1
# bundle all the things!
browserify entry1.js entry2.js -p [ factor-bundle -o bundle/entry1.js -o bundle/entry2.js ] -o bundle/common.js
# test if the bundled stuff works
cat bundle/common.js bundle/entry1.js | node && echo "WORKS"
# works!


# remove the installed moment modules
rm -r node_modules/moment*
# install moment-timezone first, moment second
npm install moment-timezone@0.4.1
npm install moment@2.10.6
# bundle all the things!
browserify entry1.js entry2.js -p [ factor-bundle -o bundle/entry1.js -o bundle/entry2.js ] -o bundle/common.js
# test if the bundled stuff works
cat bundle/common.js bundle/entry1.js | node
# does not work!
