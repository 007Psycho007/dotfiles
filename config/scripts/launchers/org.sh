#!/bin/bash

cd ~/notes/private 
nvim ./
git add . 
git commit -m "Updated Schedule at $(date)"
git push
