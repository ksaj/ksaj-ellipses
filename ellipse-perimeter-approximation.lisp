#|######################################################
##################################################

Apparently it isn't all that easy to calculate the 
perimeter (Not circumference, unless you are talking
about circles, newbs!) of an Ellipse.

So, let's compare some approximations...

##################################################
|#;#####################################################


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Matt Parker's Approximation Equations
;;


; Exhibit A - the "proper" one

(defun ellipse-perimeter-mp1 (a b)
 "perimeter ≈ π[53a/3 + 717b/35 - √(269a^2 + 667ab + 371b^2)]"

  (if (>                      a b)
      (ellipse-perimeter-mp1b a b)
      (ellipse-perimeter-mp1b b a)))

(defun ellipse-perimeter-mp1b (a b)
 "perimeter ≈ π[53a/3 + 717b/35 - √(269a^2 + 667ab + 371b^2)] springenverks"

  (* pi (- (+ (* 53  (/ a 3))
              (* 717 (/ b 35)))

           (sqrt (+ (* 269 (* a a))
                 (* 667 a b)
                 (* 371 (* b b)))))))


; Exhibit B - the "lazy" one

(defun ellipse-perimeter-mp2 (a b)
  "perimeter ≈ π(6a/5 + 3b/4)"

  (if (>                      a b)
      (ellipse-perimeter-mp2b a b)
      (ellipse-perimeter-mp2b b a)))

(defun ellipse-perimeter-mp2b (a b)
  "perimeter ≈ π(6a/5 + 3b/4) springenverks"

  (* pi (+ (/ (* a 6) 
                   5)

           (/ (* b 3) 
                   4))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Simple but reasonable approximation algorithms
;;

(defun ellipse-perimeter-ez1 (a b)
        "2π√((a^2 + b^2)/2)"

  (* (+ pi pi) 

     (sqrt (/ (+ (* a a) (* b b))
                            2))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Google's sphere perimeter approximation
;;

(defun ellipse-perimeter-ez2 (a b)
 "Google brings up a calculator when searching 'ellipse perimeter'.
                  This is the equation they use."

  (* pi (+ a b)

        (1+ (* 3 (/ (* (- a b) (- a b))

                    (* (+ (* (+ a b) (+ a b))

                       (+ 10 (sqrt (+ 4 (* -3 (/ (* (- a b) (- a b)) 
                                        (* (+ a b) (+ a b))))))))))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; A couple of Ramanujan Approximations
;;

; Exhibit A - from the video

(defun ellipse-perimeter-sr1 (a b)
 "perimeter ≈ π((a + b) + (3(a - b)^2 / (10(a + b) + √(a^2 + 14ab + b^2))))"

  (* pi (+ (+ a b)

           (/ (* 3 (* (- a b) (- a b)))

              (+ (* 10 (+ a b))
                 (sqrt (+ (* a a) 
                          (* a b 14) 
                          (* b b))))))))

; Exibit B - from a paper found online

(defun ellipse-perimeter-sr2 (a b)
 "perimeter ≈ π(a + b)(1 + (3h / (10 + √(4 - 3h))))"

  (ellipse-perimeter-sr2b a b           ; 
       (/ (* (- a b) (- a b))           ; Calculate h
       (* (+ a b) (+ a b)))))           ; then call the blinkenverks

(defun ellipse-perimeter-sr2b (a b h)
 "Blinkenverks for ellipse-perimeter-sr2"

  (* pi (+ a b)
        (1+ (/ (* 3 h)
               (+ 10 (sqrt (- 4 (* 3 h))))))))


 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;                                               ;;;;;
;;;;;                Fun User Stuff                 ;;;;;
;;;;;                ==============                 ;;;;;
;;;;;                                               ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun ellipse-area (a b)
 "Calculate Area of an Ellipse"

  (* pi a b))


(defun compare-equations (a b)
 "Compare all the equations"

 (format t "
           Matt Parker 1:  ~a
           Matt Parker 2:  ~a
           S. Ramanujan 1: ~a
           S. Ramanujan 2: ~a
           EZ Algorithm:   ~a
           Google wisdom:  ~a~%" 

   (ellipse-perimeter-mp1 a b)
   (ellipse-perimeter-mp2 a b)
   (ellipse-perimeter-sr1 a b)
   (ellipse-perimeter-sr2 a b)
   (ellipse-perimeter-ez1 a b)
   (ellipse-perimeter-ez2 a b)))


(defun help () 
  "Help!!!!"

  (format t "~%Karsten Johansson's tool for comparing ellipse perimeter approximations.~%~%")

  (format t "(ellipse-perimeter-<??> a b) where:~% mp[12] is Matt Parker,~% sr[12] is Srinivasa Ramanujan,~% ez1 is that crappy algorithm you probably learned, and~% ez2 is the equation Google uses.~%~%(compare-equations a b) - Compare each of the (ellipse-perimeter-<??> equations. This program's raison d'etre.~%~%(ellipse-area a b) - Calculate the area of a ellipse.~%~%NOTE: a and b are the major and minor axes of an ellipse, and are required input.~%~%"))


(defun eclipse ()
 "A special utility for Matt"

 (format t "Did you mean to say \"ellipse\" ?~%"))

