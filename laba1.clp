;vopros s varuant otveta
(deffunction ask-question (?question $?allowed-values)
    (print ?question)
    (bind ?answer (read))
    (if (lexemep ?answer) 
        then (bind ?answer (lowcase ?answer))
	    )
    (while (not (member$ ?answer ?allowed-values)) do
        (print ?question)
        (bind ?answer (read))
        (if (lexemep ?answer) 
            then (bind ?answer (lowcase ?answer))
		    )
	    )
    ?answer
    )

(deffunction yes-or-no (?question)
    (bind ?response (ask-question ?question yes no y n))
    (if (or (eq ?response yes) (eq ?response y))
        then yes 
        else no
	    )
    )

;Rule for collecting information about the type of hair
(defrule hair_dog
    (not (solution ?))
    (not (hair ?))
    =>
    (assert (hair (ask-question "The dog is long-haired or short - haired (Enter short or long): " short long)))
    )

;The rule of collecting information about the growth of a dog
(defrule height-dog
    (not (solution ?))
    (not (heigth ?))
    =>
    (assert (height (ask-question "The dog's height is less than 50 cm or more (less than 50 cm.-1, more than 50 cm.-2): " 1 2)))
    )

;Collecting information about the length of the dog's ears
(defrule ears_dog
    (not (solution ?))
    (not (ears ?))
    =>
    (assert (ears (ask-question "Long or short ears (Enter short or long): " short long)))
    )

;Collecting information about the length of the tail
(defrule tail_dog
    (not (solution ?))
    (not (tail ?))
    =>
    (assert (tail (ask-question "Long or short tail (Enter short or long): " short long)))
    )

;Collecting information about the dog's body
(defrule body_dog
    (not (solution ?))
    (not (body ?))
    =>
    (assert (body (ask-question "Long or short body (Enter short or long): " short long)))
	;(print body crlf)
    )


(defrule english_buldog
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears short)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "english buldog" crlf)
    )		


(defrule american_toy_fox_terrier
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears short)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "american toy fox terrier" crlf)
    )

(defrule english_toy_terrier
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears short)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "english toy terrier" crlf)
    )

(defrule basenji
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears short)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "basenji" crlf)
    )

(defrule miniature_bull_terrier
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears long)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "miniature bull terrier" crlf)
    )


(defrule dachshund
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears long)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "dachshund" crlf)
    )


(defrule smooth-haired_fox_terrier
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears long)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "smooth - haired fox terrier" crlf)
    )


(defrule welsh_corgi_pembroke
    (not (solution ?))
    (and
         (hair short)
	 (height 1)
	 (ears long)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "welsh corgi pembroke" crlf)
    )


(defrule great_dane_of_bordeaux
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears long)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "great_dane_of_bordeaux" crlf)
    )


(defrule doberman
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears short)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "doberman" crlf)
    )

(defrule canary_Great_Dane
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears short)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "canary Great Dane" crlf)
    )


(defrule english_mastiff
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears short)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "english mastiff" crlf)
    )



(defrule molossians
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears long)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "molossians" crlf)
    )

(defrule weimaraner
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears long)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "weimaraner" crlf)
    )


(defrule american_mastiff
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears long)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "american mastiff" crlf)
    )


(defrule great_dane
    (not (solution ?))
    (and
         (hair short)
	 (height 2)
	 (ears long)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "great dane" crlf)
    )


(defrule australian_terrier
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears short)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "australian terrier" crlf)
    )


(defrule australian_silky_terrier
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears short)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "australian silky terrier" crlf)
    )


(defrule belgian_griffon
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears short)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "belgian griffon" crlf)
    )


(defrule west_highland_white_terrier
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears short)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "west highland white terrier" crlf)
    )



(defrule havana_bichon
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears long)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "havana_bichon" crlf)
    )


(defrule lhasa_apso
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears long)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "lhasa apso" crlf)
    )

(defrule king_charles_spaniel
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears long)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "king charles spaniel" crlf)
    )


(defrule the_Prague_rat
    (not (solution ?))
    (and
         (hair long)
	 (height 1)
	 (ears long)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "the Prague rat" crlf)
    )



(defrule scottish_collie
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears short)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "scottish collie" crlf)
    )



(defrule afghan_shepherd
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears short)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "afghan shepherd" crlf)
    )



(defrule pyrenean_shepherd
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears short)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "pyrenean shepherd" crlf)
    )



(defrule the_afghan_hound
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears short)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "the afghan hound" crlf)
    )



(defrule the_Central_Russian_Shepherd
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears long)
	 (tail short)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "the Central Russian Shepherd" crlf)
    )



(defrule briar
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears long)
	 (tail short)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "briar" crlf)
    )




(defrule drathaar
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears long)
	 (tail long)
	 (body short)
	 )
    =>
    (assert (solution yes))
	 (print "drathaar" crlf)
    )



(defrule eastern_european_shepherd
    (not (solution ?))
    (and
         (hair long)
	 (height 2)
	 (ears long)
	 (tail long)
	 (body long)
	 )
    =>
    (assert (solution yes))
	 (print "eastern european shepherd" crlf)
    )
