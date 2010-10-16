# square.tcl --
#
# Part of: TkSquare
# Contents: test program for the widgets
# Date: Sat Aug 16, 2003
#
# Abstract
#
#
#
# Copyright (c) 2003, 2010 Marco Maggi <marco.maggi-ipsu@poste.it>
#
# The author  hereby grant permission to use,  copy, modify, distribute,
# and  license this  software  and its  documentation  for any  purpose,
# provided that  existing copyright notices  are retained in  all copies
# and that  this notice  is included verbatim  in any  distributions. No
# written agreement, license, or royalty  fee is required for any of the
# authorized uses.  Modifications to this software may be copyrighted by
# their authors and need not  follow the licensing terms described here,
# provided that the new terms are clearly indicated on the first page of
# each file where they apply.
#
# IN NO  EVENT SHALL THE AUTHOR  OR DISTRIBUTORS BE LIABLE  TO ANY PARTY
# FOR  DIRECT, INDIRECT, SPECIAL,  INCIDENTAL, OR  CONSEQUENTIAL DAMAGES
# ARISING OUT  OF THE  USE OF THIS  SOFTWARE, ITS DOCUMENTATION,  OR ANY
# DERIVATIVES  THEREOF, EVEN  IF THE  AUTHOR  HAVE BEEN  ADVISED OF  THE
# POSSIBILITY OF SUCH DAMAGE.
#
# THE  AUTHOR  AND DISTRIBUTORS  SPECIFICALLY  DISCLAIM ANY  WARRANTIES,
# INCLUDING,   BUT   NOT  LIMITED   TO,   THE   IMPLIED  WARRANTIES   OF
# MERCHANTABILITY,    FITNESS   FOR    A    PARTICULAR   PURPOSE,    AND
# NON-INFRINGEMENT.  THIS  SOFTWARE IS PROVIDED  ON AN "AS  IS" BASIS,
# AND  THE  AUTHOR  AND  DISTRIBUTORS  HAVE  NO  OBLIGATION  TO  PROVIDE
# MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#


## ------------------------------------------------------------
## Required packages.
## ------------------------------------------------------------

package require Tcl 8.4
package require Tk  8.4

if { -1 == [lsearch $auto_path /usr/local/lib] } {
    lappend auto_path /usr/local/lib
}

package require TkSquare


## ------------------------------------------------------------
## Options.
## ------------------------------------------------------------

option add *borderWidth			1

option add *Labelframe.relief		groove
option add *Labelframe.borderWidth	2


# main --
#
#	Main procedure.
#
#  Arguments:
#
#	argc -		the number of argument in "argv"
#	argv -		the list of command line arguments
#
#  Results:
#
#       Returns the empty string.
#
#  Error codes:
#
#       None.
#
#  Side effects:
#
#       None.
#

proc main { argc argv } {
    global	forever


    # Setup.

    wm withdraw .
    wm title	. "More.TK Example Widgets"
    wm geometry . +10+10

    button .quit -text Quit -command "set forever 1"
    grid   .quit

    set t [frame .frame -relief sunken]
    grid $t -padx 2m -pady 2m -ipadx 2m -ipady 2m

    bind Button <Return> "%W flash; %W invoke"
    bind . <Escape> "set forever 1"


    # Square widget.

    set f $t.1
    set w $f.square
    set b $f.button

    labelframe $f -text "Square"
    square $w
    button $b -text "Move" -command "configure_square $w"

    grid $w $b
    grid $f -ipadx 2m -ipady 2m

    # Another square widget.

    set f $t.2
    set w $f.square

    labelframe $f -text "Spiraling Square"
    square $w

    after 100 "spiraling_square $w"
    grid $w
    grid $f -ipadx 2m -ipady 2m

    update
    $w configure \
	    -posx [expr {[winfo width $w]/2}] \
	    -posy [expr {[winfo height $w]/2}]

    # Let's go.

    wm deiconify .
    focus .quit
    vwait forever
    exit 0
}


## ------------------------------------------------------------
## Procedures.
## ------------------------------------------------------------

proc configure_square { square } {
    set x [$square cget -posx]
    set y [$square cget -posy]

    set width	[winfo width  $square]
    set height	[winfo height $square]

    set x [expr {($x+5)%$width}]
    set y [expr {($x+10)%$height}]

    $square configure -posx $x -posy $y
    return
}

set xc 50
set yc 50
set radius 10
set theta 0
set delta 1

proc spiraling_square { square } {
    global	xc yc radius theta delta

    set size	[$square cget -size]
    set x	[$square cget -posx]
    set y	[$square cget -posy]
    set width	[winfo width $square]
    set height	[winfo height $square]

    set x [expr {$xc+$radius*cos($theta)}]
    set y [expr {$yc+$radius*sin($theta)}]

    incr radius $delta

    if {
	($radius <= 0) ||
	(($radius+$size > $width/2) || ($radius+$size > $height/2))
    } {
	set delta [expr {-$delta}]
    }

    set theta [expr {$theta+0.2}]

    $square configure -posx $x -posy $y

    after 25 "spiraling_square $square"
    return
}


## ------------------------------------------------------------
## Main script.
## ------------------------------------------------------------

main $argc $argv


### end of file
