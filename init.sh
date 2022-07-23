#!/bin/bash
for dir in ./*/
do
	stowable=${dir//./}
	stowable=${dir//\//}
	echo ${stowable}
done
