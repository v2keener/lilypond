/*
  axes.hh -- declare Axis

  source file of the GNU LilyPond music typesetter

  (c)  1997--1998 Han-Wen Nienhuys <hanwen@stack.nl>
*/


#ifndef AXES_HH
#define AXES_HH

enum Axis {
    X_AXIS =0,
    Y_AXIS =1,
    NO_AXES=2,
};

#ifndef STANDALONE

#include "string.hh"		// ugh

String axis_name_str (Axis);

#endif // STANDALONE

/**
  the operator ++ for Axis. 
 */
Axis post_incr(Axis &);
Axis incr(Axis &);
//Axis operator++(Axis);



#endif // AXES_HH
