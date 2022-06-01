(defun has (l)
    (cond
        ((null l) nil)
        (t (OR (numberp (car l)) (has (cdr l))) )
    )
    
)

(format t "has '(a b c 2) -> ~S ~%" (has '(a b c 2)))
(format t "has '(a b c) -> ~S ~%" (has '(a b c)))