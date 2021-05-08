;For a given tree of type (2) return the path from the root node to a certain given node X
;(A (B) (C (D) (E))) (2)

(defun path (tree nodeToSearch)
  (cond ((null tree) nil)
        ;;;; if empty list, we return empty list
        ((eq (car tree) nodeToSearch) (list nodeToSearch))
        ;;;; if nodeToSearch is the root, we return a list containing only the nodeToSearch
        (t (mapcan (lambda (subtree)
        ;;;; otherwise
        ;;;; we use mapcan to work at the same index => so on the same level
                     (let ((p (path subtree nodeToSearch))) 
                     ;;;; we use recursion and store result in p
                       (when p (cons (car tree) p))))
                       ;;;; if p exists we add it to the end result
                   (cdr tree)))))
                   
                   
(format t "path (A (B) (C (D) (E))) A -> ~S ~%" (path (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'A ))

(format t "path (A (B) (C (D) (E))) B -> ~S ~%" (path (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'B ))

(format t "path (A (B) (C (D) (E))) C -> ~S ~%" (path (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'C ))

(format t "path (A (B) (C (D) (E))) D -> ~S ~%" (path (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'D ))

(format t "path (A (B) (C (D) (E))) E -> ~S ~%" (path (list 'A (list 'B) (list 'C (list 'D) (list 'E))) 'E ))

;        A
;       / \
;      B   C
;         / \
;        D   E