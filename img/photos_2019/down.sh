#!/bin/bash
mkdir downsized
for filename in .; do
	convert -resize 20% $filename downsized/$filename
done
