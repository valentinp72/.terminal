#!/usr/bin/env bash

theme="$HOME/.config/rofi/launchers/type-7/style-7.rasi"

rofi -show calc -modi calc -no-show-match -no-sort -theme $theme -theme-str "window {width: 800px;}"

