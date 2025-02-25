(define (domain muddy_children)
  (:requirements :strips :typing :numeric-fluents)
  (:types
    teacher
    children
  )

  ;; Boolean properties become predicates, numeric become functions
  (:predicates
    (shouted)             ; Global boolean condition: has someone shouted?
    (muddy ?c - children) ; Whether a specific child is muddy
  )

  ;; Numeric function
  (:functions
    (num_of_question ?t - teacher)
  )

  ;; Action: child says yes
  (:action say_yes
    :parameters (?c - children)
    :precondition (and 
      (not (shouted))   ;; no one has shouted yet
      (muddy ?c)        ;; child is muddy
    )
    :effect (and
      (shouted)         ;; now "shouted" is true
    )
  )

  ;; Action: teacher asks a question
  (:action ask
    :parameters (?t - teacher)
    :precondition (and )
    :effect (and
      (increase (num_of_question ?t) 1)
    )
  )
)