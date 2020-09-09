# Karsten Johansson's Ellipse Perimeter Approximation Comparisons

Recently Matt Parker of Stand-up Maths did a fascinating Youtube episode on
Perimeter Approximations. https://www.youtube.com/watch?v=5nW3nJhBHL0

In this episode, Parker comes up with two equations, which are titled the 
Parker Ellipse Perimeter Approximation and the Parker Lazy Ellipse Perimeter Approximation.

This program compares Matt's two equations with two Ramanujan solutions and a commonly used solution, which I have referred to as the EZ algorithm for convenience. One of the Ramanujan solutions is as described in Matt's video, and the second is one a grabbed from on or Ramanujan's papers, and differs from the video examples.

Additionally I noticed Google presents yet another solution when you search for the phrase "ellipse perimeter" so I have coded that here for comparison as well.

# Instructions

Load this up in any Common Lisp REPL. I coded this with clisp, but there is nothing unusual in the code so it should work everywhere. I purposely kept the code in script form so everything could be in one file.

There is a (help) function if you want to know more of the internals, but you can get away with simply using (compare-equations a b), where a and b are the major and minor axes. Matt's algorithms require the a to be the larger number, but I baked it into the code so it doesn't matter.

I also included (ellipse-area a b) if you want to calculate the area of an ellipse. The code for that was super easy, so why not...

## Example

Here's a way to get started using the clisp REPL:

[1]> (load 'ellipse-perimeter.lisp)
...snip...

[2]> (compare-equations 5 7)

           Matt Parker 1:  37.961613
           Matt Parker 2:  38.170350741115987848L0
           S. Ramanujan 1: 37.96137
           S. Ramanujan 2: 37.96137
           EZ Algorithm:   38.219124
           Google wisdom:  40.599434
NIL
[7]>

# License

I don't own any of the equations. Any copyrights belong to the respective owners, conveniently named in the equation title.

Go ahead and use the Lisp code. If you do use any of the code, please simply give credit and a link to this repository.

If people would like to add to this, add your name in the doc string, and I'll change the text here as well.



