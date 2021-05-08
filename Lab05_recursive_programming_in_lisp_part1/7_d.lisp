;;;;Write a function to test whether a linear list is a set.

(defun is-member (number linearList)
    (if (null linearList)
        ;if linearList is empty the number has not been found
        NIL
        (if (= (car linearList) number)
            ;if number is the head of the list we found it
            T
            ;else itterate recursively
            (is-member number (cdr linearList))
        )
    )
)

(format t "is-member 8 (list 3 8 9 9) -> ~S ~%" (is-member 8 (list 3 8 9 9)))
(format t "is-member 7 (list 3 8 9 9) -> ~S ~%" (is-member 7 (list 3 8 9 9)))
(format t "is-member 8 () -> ~S ~%" (is-member 8 ()))
(format t "~%~%")

(defun is-set (linearList)
    (if (null linearList)
        ;if linearList is empty it's a set
        T
        (if (is-member (car linearList) (cdr linearList))
            ;if the head exists in the tail it is not a set
            NIL
            ;else itterate recursively
            (is-set (cdr linearList))
        )
    )
    
)


(format t "is-set (list 3 8 9 9) -> ~S ~%" (is-set (list 3 8 9 9)))
(format t "is-set (list 3 8 9) -> ~S ~%" (is-set (list 3 8 9)))
(format t "is-set () -> ~S ~%" (is-set ()))