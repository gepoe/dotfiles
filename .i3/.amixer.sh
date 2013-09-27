#!/bin/bash

vol=$(amixer get 'Master',0 | egrep -o -m 1 '[0-9]{1,3}%'| egrep -o -m 1 '[0-9]{1,3}%')
echo "${vol%[%]}"
