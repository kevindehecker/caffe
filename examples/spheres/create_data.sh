#!/usr/bin/env sh

TOOLS=qtcreator-build/tools
EXAMPLE=examples/spheres
DATA=data/spheres
DBTYPE=leveldb

echo "Creating $DBTYPE..."

rm -rf $EXAMPLE/train_$DBTYPE  $EXAMPLE/test_$DBTYPE

$TOOLS/convert_imageset-d -backend=$DBTYPE -gray -shuffle $EXAMPLE/data $EXAMPLE/data/data.txt $EXAMPLE/train_$DBTYPE/
$TOOLS/convert_imageset-d -backend=$DBTYPE -gray -shuffle $EXAMPLE/data $EXAMPLE/data/data.txt $EXAMPLE/test_$DBTYPE/

echo "Computing image mean..."

$TOOLS/compute_image_mean-d -backend=$DBTYPE $EXAMPLE/train_$DBTYPE/ $EXAMPLE/mean.binaryproto

echo "Done."