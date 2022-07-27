#!/bin/bash

rm ~/.zshrc

for dir in ./*/
do
	stowable=${dir//./}
	stowable=${stowable//\//}
	stow ${stowable}
done
