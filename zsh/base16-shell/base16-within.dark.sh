#!/bin/sh
# Base16 Within - Shell color setup script to match within.png wallpaper
# Peter M. Farr

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="28/2A/2E" # Base 00 - Black
color01="28/2A/2E" # Base 08 - Red
color02="50/94/40" # Base 0B - Green
color03="f0/91/7b" # Base 0A - Peach
color04="5f/81/9d" # Base 0D - Blue
color05="85/67/8f" # Base 0E - Magenta
color06="5e/8d/87" # Base 0C - Cyan
color07="70/78/80" # Base 05 - White
color08="37/3b/41" # Base 03 - Bright Black
color09="c6/52/36" # Base 08 - Bright Red
color10="f2/e2/a8" # Base 0B - Bright Green
color11="f0/c6/74" # Base 0A - Bright Yellow
color12="9a/ba/f7" # Base 0D - Bright Blue
color13="b2/94/bb" # Base 0E - Bright Magenta
color14="99/d0/f4" # Base 0C - Bright Cyan
color15="f8/e8/e3" # Base 07 - Bright White
color16="ff/99/00" # Base 09
color17="33/00/ff" # Base 0F
color18="40/40/40" # Base 01
color19="60/60/60" # Base 02
color20="c0/c0/c0" # Base 04
color21="e0/e0/e0" # Base 06
color_foreground="f4/ac/9a" # Base 05
color_background="00/00/00" # Base 00
color_cursor="d0/d0/d0" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15

# 256 color space
printf $printf_template 16 $color16
printf $printf_template 17 $color17
printf $printf_template 18 $color18
printf $printf_template 19 $color19
printf $printf_template 20 $color20
printf $printf_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg d0d0d0 # forground
  printf $printf_template_custom Ph 000000 # background
  printf $printf_template_custom Pi d0d0d0 # bold color
  printf $printf_template_custom Pj 606060 # selection color
  printf $printf_template_custom Pk d0d0d0 # selected text color
  printf $printf_template_custom Pl d0d0d0 # cursor
  printf $printf_template_custom Pm 000000 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
unset color_cursor
