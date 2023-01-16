#!/bin/bash

cd ~/notes 
nvim ./
git add . 
git commit -m "Updated Schedule at $(date)"
git push
