;;;;Write a function to return the set of all the atoms of a list. Exemplu: (1 (2 (1 3 (2 4) 3) 1) (1 4)) ==> (1 2 3 4)


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


(defun unique-number-atoms-util (inputList output)
    (cond
        ((null inputList) (return-from unique-number-atoms-util output))
            ;return output when inputList(input) is empty
        ((atom (car inputList)) 
            ;if first element is an atorm 
            (if (is-member (car inputList) output)
                ;if it's already in the output we don't add it again
                (unique-number-atoms-util (cdr inputList) output) 
                ;else we add it
                (unique-number-atoms-util (cdr inputList) (cons (car inputList) output))
            ))
        ((listp (car inputList))
                ;if first element is a list we redirect the output of it and as output to the next element
                (unique-number-atoms-util (cdr inputList) (unique-number-atoms-util (car inputList) output))
        )
    )
)

;;;;wrapper
(defun unique-number-atoms (inputList)
    (unique-number-atoms-util inputList ())
)

(format t "unique-number-atoms (1 (2 (1 3 (2 4) 3) 1) (1 4)) () -> ~S ~%" (unique-number-atoms (list 1 (list 2 (list 1 3 (list 2 4) 3) 1) (list 1 4)) ) )
(format t "unique-number-atoms (1 (2 (1 3 (2 4) 8) 7) (1 4)) () -> ~S ~%" (unique-number-atoms (list 1 (list 2 (list 1 3 (list 2 4) 8) 7) (list 1 4)) ) )
