;;;;write a function to eliminate the n-th elemenet of a linear list

(defun remove-nth-elemenet (n linearList)
    (if (or (zerop n) (null linearList))
        ;if the list is empty or n is zero we simply return the rest of the list
        (cdr linearList)
        ;else we recursively decrease n and collect the first element and the rest of the list
        (cons (car linearList) (remove-nth-elemenet (1- n) (cdr linearList)))
    )
)

(format t "remove-nth-elemenet 0 (list 1 2 3 4) -> ~S ~%" (remove-nth-elemenet 0 (list 1 2 3 4)))

(format t "remove-nth-elemenet 2 (list 1 2 3 4 5 6) -> ~S ~%" (remove-nth-elemenet 2 (list 1 2 3 4 5 6)))

(format t "remove-nth-elemenet 4 (list 2 5 6 4 9 13) -> ~S ~%" (remove-nth-elemenet 4 (list 2 5 6 4 9 13)))