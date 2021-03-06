#!/bin/bash
set -x

sed -i 'y/āáǎàēéěèīíǐìōóǒòūúǔùǖǘǚǜĀÁǍÀĒÉĚÈĪÍǏÌŌÓǑÒŪÚǓÙǕǗǙǛ/aaaaeeeeiiiioooouuuuuuuuAAAAEEEEIIIIOOOOUUUUUUUU/' $TRAVIS_BUILD_DIR/english.cards.csv

mkdir $TRAVIS_BUILD_DIR/build
mkdir $TRAVIS_BUILD_DIR/pdf

python $TRAVIS_BUILD_DIR/countersheet.py -r 30 -n deck -d $TRAVIS_BUILD_DIR/english.cards.csv -p $TRAVIS_BUILD_DIR/build $TRAVIS_BUILD_DIR/english.cards.svg > $TRAVIS_BUILD_DIR/build/en.standard.deck.svg
pdftk $TRAVIS_BUILD_DIR/build/*.pdf cat output $TRAVIS_BUILD_DIR/pdf/standard.deck.en.pdf
rm $TRAVIS_BUILD_DIR/build/*.pdf

#python $TRAVIS_BUILD_DIR/countersheet.py -r 30 -n deck -d $TRAVIS_BUILD_DIR/english.cards.csv -p $TRAVIS_BUILD_DIR/build $TRAVIS_BUILD_DIR/italian.cards.svg > $TRAVIS_BUILD_DIR/build/it.standard.deck.svg
#pdftk $TRAVIS_BUILD_DIR/build/*.pdf cat output $TRAVIS_BUILD_DIR/pdf/standard.deck.it.pdf
#rm $TRAVIS_BUILD_DIR/build/*.pdf