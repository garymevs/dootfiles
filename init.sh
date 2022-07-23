#!/bin/bash
for dir in ./*/
do
	stowable=${dir//./}
	stowable=${stowable//\//}
	stow ${stowable}
done
