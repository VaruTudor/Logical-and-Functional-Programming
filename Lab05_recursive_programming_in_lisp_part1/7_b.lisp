;;;;Write a function to determine the successor of a number represented digit by digit as a list, without transforming the representation of the number from list to number. Example: (1 9 3 5 9 9) --> (1 9 3 6 0 0)

(defun successor-util (inputList flag)
    (if (null inputList)
        ;if the list is empty return the rest of the list
        (cdr inputList)
        (if (= flag 0)
            ;if the flag is 0, meaning that we did not change any number different than 9 from the list, we continue checking
            (if (= (car inputList) 9)
                ;if the number is 9 we change it to 0
                (cons 0 (successor-util (cdr inputList) flag))
                ;if the number is different than 9 we increment it and set the flag to 1
                (cons (1+ (car inputList)) (successor-util (cdr inputList) (1+ flag)))
            )
            ;if the flag is 1 we simply add each element one by one without modifications
            (cons (car inputList) (successor-util (cdr inputList) flag))
        )
    )
)

;;;;wrapper for successor-util
(defun successor (inputList)
    (reverse (successor-util (reverse inputList) 0))
)


(format t "successor (list 3 8 9 9) -> ~S ~%" (successor (list 3 8 9 9)))
(format t "successor (list 1 9 3 5 9 9) -> ~S ~%" (successor (list 1 9 3 5 9 9)))
(format t "successor (list 0) -> ~S ~%" (successor (list 0)))
(format t "successor (list 1 9) -> ~S ~%" (successor (list 1 9)))
(format t "successor (list 1 8) -> ~S ~%" (successor (list 1 8)))