(defun sum (l)
    (cond
        ((numberp l) l)
        ((atom l) 0)
        (t (+ (sum (car l)) (sum (cdr l))) )
    )
)

(format t "sum '(1 (2 a (3 4) b 5) c 1) -> ~S ~%" (sum '(1 (2 a (3 4) b 5) c 1)))