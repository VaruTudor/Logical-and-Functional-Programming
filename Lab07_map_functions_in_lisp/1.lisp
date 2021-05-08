;write a function to check if an element is member of a non-linaer list
             
(defun isMemberUtil (nonLinearList toSearchAtom)
    (mapcan
        (lambda (element)
            (cond 
                ;;;; element found, add to list
                ((eq element toSearchAtom) (list element))
                ;;;; any other atom, don't add
                ((atom element) nil)
                ;;;; otherwise, call using recursion
                (t (isMemberUtil element toSearchAtom))))
        nonLinearList))        
        
(defun isMember (nonLinearList toSearchAtom)
    (cond
        ((eq (isMemberUtil nonLinearList toSearchAtom) nil) nil)
        (t t)
    )
)  
        
        
(format t "isMember (A B C D E) B -> ~S ~%" (isMember (list 'A 'B 'C 'D 'E) 'B))
(format t "isMember (A B C D E) F -> ~S ~%" (isMember (list 'A 'B 'C 'D 'E) 'F))
(format t "isMember (A (B) (C (D) (E))) E -> ~S ~%" (isMember (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'E))
(format t "isMember (A (B) (C (D) (E))) B -> ~S ~%" (isMember (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'B))
(format t "isMember (A (G) (C (D) (E))) B -> ~S ~%" (isMember (list 'A (list 'G) (list 'C (list 'D) (list 'E))) 'B))
(format t "isMember (A (B) (B (D) (E))) B -> ~S ~%" (isMember (list 'A (list 'B) (list 'B (list 'D) (list 'E))) 'B))
(format t "isMember (A (B) (B (B) (E))) B -> ~S ~%"  (isMember (list 'A (list 'B) (list 'B (list 'B) (list 'E))) 'B))


