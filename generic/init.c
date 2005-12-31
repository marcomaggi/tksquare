/* init.c --
   
   Part of: TkSquare
   Contents: initialisation functions
   Date: Sat Aug 16, 2003
   
   Abstract
   
   
   
   Copyright (c) 2003 Marco Maggi
   
   The author  hereby grant permission to use,  copy, modify, distribute,
   and  license this  software  and its  documentation  for any  purpose,
   provided that  existing copyright notices  are retained in  all copies
   and that  this notice  is included verbatim  in any  distributions. No
   written agreement, license, or royalty  fee is required for any of the
   authorized uses.  Modifications to this software may be copyrighted by
   their authors and need not  follow the licensing terms described here,
   provided that the new terms are clearly indicated on the first page of
   each file where they apply.
   
   IN NO  EVENT SHALL THE AUTHOR  OR DISTRIBUTORS BE LIABLE  TO ANY PARTY
   FOR  DIRECT, INDIRECT, SPECIAL,  INCIDENTAL, OR  CONSEQUENTIAL DAMAGES
   ARISING OUT  OF THE  USE OF THIS  SOFTWARE, ITS DOCUMENTATION,  OR ANY
   DERIVATIVES  THEREOF, EVEN  IF THE  AUTHOR  HAVE BEEN  ADVISED OF  THE
   POSSIBILITY OF SUCH DAMAGE.
   
   THE  AUTHOR  AND DISTRIBUTORS  SPECIFICALLY  DISCLAIM ANY  WARRANTIES,
   INCLUDING,   BUT   NOT  LIMITED   TO,   THE   IMPLIED  WARRANTIES   OF
   MERCHANTABILITY,    FITNESS   FOR    A    PARTICULAR   PURPOSE,    AND
   NON-INFRINGEMENT.  THIS  SOFTWARE IS PROVIDED  ON AN "AS  IS" BASIS,
   AND  THE  AUTHOR  AND  DISTRIBUTORS  HAVE  NO  OBLIGATION  TO  PROVIDE
   MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

  
   $Id: init.c,v 1.1.1.3 2003/08/16 15:49:42 marco Exp $
*/



/** ------------------------------------------------------------
 ** Header files.
 ** ----------------------------------------------------------*/

#include "tksquareInt.h"



/** ------------------------------------------------------------
 ** Prototypes.
 ** ----------------------------------------------------------*/

EXTERN int	Tksquare_Init		_ANSI_ARGS_((Tcl_Interp *interp));
EXTERN int	Tksquare_SafeInit	_ANSI_ARGS_((Tcl_Interp *interp));

EXTERN int	SquareObjCmd		_ANSI_ARGS_((__TCL_COMMAND_ARGS__));



/* Tksquare_Init --

	Initialises the package.

   Arguments:

	interp -	the current interpreter

   Results:

        Return TCL_OK or TCL_ERROR.

   Side effects:

        none

*/

EXTERN int
Tksquare_Init (Tcl_Interp *interp)
{
  int		e;
  CONST char *	varName;
  Tcl_DString	fileName;


#ifdef USE_TCL_STUBS
  if (Tcl_InitStubs(interp, "8.4", 0) == NULL) {
    return TCL_ERROR;
  }
#endif

#ifdef USE_TK_STUBS
  if (Tk_InitStubs(interp, "8.4", 0) == NULL) {
    return TCL_ERROR;
  }
#endif

  varName = Tcl_GetVar(interp, "::tksquare_library", TCL_LEAVE_ERR_MSG);
  if (varName == NULL)
    {
      return TCL_ERROR;
    }

  Tcl_DStringInit(&fileName);
  if (strlen(varName) > 0)
    {
      Tcl_DStringAppend(&fileName, varName, -1);
      Tcl_DStringAppend(&fileName, "/", -1);
    }
  Tcl_DStringAppend(&fileName, "tkSquare.tcl", -1);

  e = Tcl_EvalFile(interp, Tcl_DStringValue(&fileName));

  Tcl_DStringFree(&fileName);

  if (e != TCL_OK)
    {
      return TCL_OK;
    }
  
  Tcl_CreateObjCommand(interp, "square", SquareObjCmd, NULL, NULL);
  return Tcl_PkgProvide(interp, "tksquare", VERSION);
}


/* Tksquare_SafeInit --

	Initialises the package for a safe TCL interp.

   Arguments:

	interp -	the current interpreter

   Results:

        Return TCL_OK or TCL_ERROR.

   Side effects:

        none

*/

EXTERN int
Tksquare_SafeInit(Tcl_Interp *interp)
{
  return Tksquare_Init(interp);
}


/* end of file */
