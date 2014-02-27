#lang racket
(require gigls/unsafe)

(context-set-bgcolor! "black")
(define landscape (image-show 
                   (image-new 9 5)))


(context-set-bgcolor! "yellow")
(define portrait (image-show
                  (image-new 5 7)))
(image-set-pixel! landscape 0 0 (rgb-new 255 0 0))
(image-set-pixel! portrait 0 0 (rgb-new 255 0 0))
(image-set-pixel! landscape 8 4 (rgb-new 0 0 255))
(image-set-pixel! portrait 4 6 (rgb-new 0 0 255))

(define self-portrait (image-show
                        (image-load "/home/kittaneh17/Desktop/me.jpg")))



(image-set-pixel! portrait 1 3 (rgb-new 0 255 0))
(image-set-pixel! portrait 2 3 (rgb-new 0 255 0))
(image-set-pixel! portrait 3 3 (rgb-new 0 255 0))
(image-set-pixel! portrait 2 2 (rgb-new 0 255 0))
(image-set-pixel! portrait 2 4 (rgb-new 0 255 0))

(image-refresh-display! portrait)
(image-refresh-display! landscape)

(define fave1 (color-name->rgb "moccasin"))
(define fave2 (color-name->rgb "sienna"))
(define fave3 (color-name->rgb "peru"))

;Fave1
(rgb-red fave1)
(rgb-green fave1)
(rgb-blue fave1)

;Fave 2
(rgb-red fave2)
(rgb-green fave2)
(rgb-blue fave2)

;Fave 3
(rgb-red fave3)
(rgb-green fave3)
(rgb-blue fave3)

(image-set-pixel! portrait 0 0 (rgb-new 
                                (rgb-red fave1) 
                                (rgb-green fave1) 
                                (rgb-blue fave1)
                                ))
(image-set-pixel! portrait 1 0 (rgb-new 
                                (rgb-red fave1) 
                                (rgb-green fave1) 
                                (rgb-blue fave1)
                                ))
(image-set-pixel! portrait 2 0 (rgb-new 
                                (rgb-red fave1) 
                                (rgb-green fave1) 
                                (rgb-blue fave1)
                                ))
(image-set-pixel! portrait 3 0 (rgb-new 
                                (rgb-red fave1) 
                                (rgb-green fave1) 
                                (rgb-blue fave1)
                                ))
(image-set-pixel! portrait 4 0 (rgb-new 
                                (rgb-red fave1) 
                                (rgb-green fave1) 
                                (rgb-blue fave1)
                                ))

(image-set-pixel! landscape 1 0 (rgb-new 
                                (rgb-red fave2) 
                                (rgb-green fave2) 
                                (rgb-blue fave2)
                                ))
(image-set-pixel! landscape 2 1 (rgb-new 
                                (rgb-red fave3) 
                                (rgb-green fave3) 
                                (rgb-blue fave3)
                                ))
(image-set-pixel! landscape 1 2 (rgb-new 
                                (rgb-red fave2) 
                                (rgb-green fave2) 
                                (rgb-blue fave2)
                                ))
(image-set-pixel! landscape 2 3 (rgb-new 
                                (rgb-red fave3) 
                                (rgb-green fave3) 
                                (rgb-blue fave3)
                                ))

(image-set-pixel! landscape 1 4 (rgb-new 
                                (rgb-red fave2) 
                                (rgb-green fave2) 
                                (rgb-blue fave2)
                                ))



(define fave4 (color-name->rgb "green"))
(define fave5 (color-name->rgb "blue"))
(define fave6 (color-name->rgb "red"))

(define middle (image-get-pixel self-portrait (/ 218 2) (/ 282 2)))

(rgb-red middle)
(rgb-green middle)
(rgb-blue middle)

(image-set-pixel! portrait 2 3 (rgb-new 
                                (rgb-red middle)
                                (rgb-green middle)
                                (rgb-blue middle)
                                ))

(image-set-pixel! landscape 6 4 (rgb-new 255 0 0))
(image-set-pixel! landscape 7 4 (rgb-new 0 255 0))
(image-set-pixel! landscape 8 4 (rgb-new 0 0 255))

(rgb->color-name (rgb-new 255 0 0))
(rgb->color-name (rgb-new 0 255 0))
(rgb->color-name (rgb-new 0 0 255))

(image-set-pixel! landscape 6 3 (rgb-new 255 255 0))
(image-set-pixel! landscape 8 3 (rgb-new 255 0 255))
(image-set-pixel! landscape 7 3 (rgb-new 0 255 255))

(rgb->color-name (rgb-new 255 255 0))
(rgb->color-name (rgb-new 255 0 255))
(rgb->color-name (rgb-new 0 255 255))

(image-set-pixel! landscape 4 2 (rgb-new 192 192 0))
(image-set-pixel! landscape 5 2 (rgb-new 128 128 0))
(image-set-pixel! landscape 6 2 (rgb-new  64  64 0))
(image-set-pixel! landscape 7 2 (rgb-new 192 64 0))
(image-set-pixel! landscape 8 2 (rgb-new 64 192 0))

(rgb->color-name (rgb-new 192 192 0))
(rgb->color-name (rgb-new 128 128 0))
(rgb->color-name (rgb-new  64  64 0))
(rgb->color-name (rgb-new 192 64 0))
(rgb->color-name (rgb-new 64 192 0))

(image-set-pixel! landscape 6 1 (rgb-new 128 128 128))
(image-set-pixel! landscape 7 1 (rgb-new 255 255 255))
(image-set-pixel! landscape 8 1 (rgb-new 0 0 0))

(rgb->color-name (rgb-new 128 128 128))
(rgb->color-name (rgb-new 255 255 255))
(rgb->color-name (rgb-new 0 0 0))


(image-refresh-display! portrait)
(image-refresh-display! landscape)
