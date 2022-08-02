#!/bin/bash

rm ~/.zshrc
# TODO: look at a way of deploying plugins and stuff?
#rm -rf ~/.oh-my-zsh

for dir in ./*/
do
	stowable=${dir//./}
	stowable=${stowable//\//}
	stow ${stowable}
done
