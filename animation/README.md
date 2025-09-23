# Animation Library

## Notes/Design Choices
The Animation Library does not have code for positioning sprites or finite state machines. The `c_frame` attribute of a
given `animation_set` represents the current sprite from the sprite list, and this can be passed to `spr()` or `mset()`
without interfering with any of the physics or input code. It is loosely coupled and discrete, following pragmatic code
design.

## Usage
Using the animation library is quite simple. Creating an animation set does require formatting an `animation_set` table 
(a constructor wasn't created for token count and for ease of use). 

## Classes

## Functions
