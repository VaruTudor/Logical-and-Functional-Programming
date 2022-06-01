(setq *print-case* :capitalize)

(defvar *age* 18)

(if (= *age* 18)
    (format t "you can vote ~%")
    (format t "you can't vote ~%"))
    
(if (or (<= *age* 14) (>= *age* 67))
    (format t "you can work ~%")
    (format t "you must work ~%"))