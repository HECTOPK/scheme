(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (cross-zero? x) 
 (and (>= (upper-bound x) 0) (<= (lower-bound) 0)))

(define (div-interval x y)
  (if (cross-zero? y)
      (error "cross zero interval " y)
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (sub-interval x y) 
  (make-interval (- (lower-bound y) (upper-bound x)) 
                 (- (upper-bound y) (lower-bound x))))




(define (make-interval a b) (cons a b))
(define (make-center-percent x r) (make-interval (- x (* x (/ r 100))) (+ x (* x (/ r 100)))))
(define (upper-bound i) (car i))
(define (lower-bound i) (cdr i))
(define (percent i) 
  ((let ((x (/ (+ (car i) (cdr i)) 2)))
    (* 100 (/ (- (cdr i) x) x)))))
