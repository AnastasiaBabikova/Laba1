(deffunction ask-value (?question)
    (print ?question)
    (bind ?answer (read))
    ?answer
    )

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

(defrule wear_jacket
    (not (solution ?))
    (not (jacket ?))
    =>
    (assert (jacket (yes-or-no "Are you wearing a jacket?: ")))
    )

(defrule wear_trousers
    (not (solution ?))
    (not (trousers ?))
    =>
    (assert (trousers (yes-or-no "Are you wearing trousers?: ")))
    )

(defrule determenite-temp
    (not (solution ?))
    (not (temp ?))
    =>
    (assert (temp (ask-value "Enter your air temperature: ")))
    )

(defrule determenite-temp-is-normal
    (not (solution ?))
    (not (temp-normal ?))
    (temp ?value)
    =>
    (if (and (< ?value 25.0) (> ?value 15.0))
        then (assert (temp-normal yes))
        else (assert (temp-normal no))
	    )
    )

(defrule wear_skirt
    (not (solution ?))
    (not (skirt ?))
    =>
    (assert (skirt (yes-or-no "Knee length skirt?: ")))
    )

(defrule wear_skirt_skinny
    (not (solution ?))
    (not (skirt_skinny ?))
    =>
    (assert (skirt_skinny (yes-or-no "Skinny skirt?: ")))
    )

(defrule wear_comfortable_shoes
    (not (solution ?))
    (not (comfortable_shoes ?))
    =>
    (assert (comfortabl_shoes (yes-or-no "Comfortable shoes?: ")))
    )

(defrule wear_sports_shoes
    (not (solution ?))
    (not (sports_shoes ?))
    =>
    (assert (sports_shoes (yes-or-no "Sports shoes?: ")))
    )

(defrule sweatshirt_hood
    (not (solution ?))
    (not (hood ?))
    =>
    (assert (hood (yes-or-no "There is a hood?: ")))
    )

(defrule sweatshirt_warm
    (not (solution ?))
    (not (warm_clothes ?))
    =>
    (assert (warm_clothes  (yes-or-no "Warm clothes?: ")))
    )


(defrule Costume
    (and 
	    (jacket yes)
		(trousers yes)
	    )
    (not (solution ?))
    =>
    (assert (Costume yes))
	(print "Do you have a costume" crlf)
	)

(defrule Dress
    (and 
	    (jacket no)
		(trousers no)
	    )
    (not (solution ?))
    =>
    (assert (Dress yes))
	(print "Do you have a dress" crlf)
	)

(defrule Skirt
    (and 
	    (and 
		    (temp-normal yes) 
			(skirt yes)
			) 
	    (skirt_shoes no)
	    )
    (not (solution ?))
    =>
    (assert (Skirt yes))
	(print "Do you have a skirt" crlf)
	)

(defrule Shoes
    (and 
	    (comfortable_shoes yes)
		(sports_shoes yes)
	    )
    (not (solution ?))
    =>
    (assert (Shoes yes))
	(print "Do you have a shoes" crlf)
	)

(defrule Hoody
    (and 
	    (and 
		    (temp-normal no) 
			(hood yes)
			) 
	    (warm_clothes yes)
	    )
    (not (solution ?))
    =>
    (assert (Hoody yes))
	(print "Do you have a hoody" crlf)
	)

(defrule T-shirt
    (and 
	    (hood no)
		(warm_clothes no)
	    )
    (not (solution ?))
    =>
    (assert (T-shirt yes))
	(print "Do you have a T-shirt" crlf)
	)

(defrule Classic_style
    (or 
	    (or
		    (Costume yes) 
			(Dress yes)
			) 
	    (Skirt yes)
	    )
    (not (solution ?))
    =>
    (assert (Classic_style yes))
	(print "You have a classic style" crlf)
	)


(defrule Sports_style
    (or 
	    (or
		    (Shoes yes) 
			(Hoody yes)
			) 
	    (T-shirt yes)
	    )
    (not (solution ?))
    =>
    (assert (Sports_style yes))
	(print "You have a sports style" crlf)
	)




(defrule University_or_Theatre
    
	    (Classic_style yes)
		
	    
    (not (solution ?))
    =>
    (assert (University_or_Theatre yes))
	(print "Are you going to university or to the theater" crlf)
	)

(defrule University_or_Gym
    
	    (Sports_style yes)
		
	   
    (not (solution ?))
    =>
    (assert (University_or_Gym yes))
	(print "Are you going to university or to the gym" crlf)
	)