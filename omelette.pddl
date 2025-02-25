(define (domain omelette_example)
    (:requirements :strips :typing)

    (:types
        egg container
    )

    (:predicates
        (good ?e - egg)                         ; Indicates that an egg is good
        (bad ?e - egg)                          ; Indicates that an egg is bad
        (in ?e - egg ?c - container)            ; Egg is in a specific container
        (empty ?c - container)                  ; Container is empty
        (smelled ?e - egg)                      ; Egg has been smelled
        (bowl_has_good_eggs ?n - number)        ; Bowl contains exactly n good eggs
    )

    ; Action: Break an egg into the saucer
    (:action break_into_saucer
        :parameters (?e - egg ?s - container)
        :precondition (and (empty ?s) (not (in ?e ?s)))
        :effect (and
            (in ?e ?s)
            (not (empty ?s))))

    ; Action: Smell the egg in the saucer
    (:action smell_egg
        :parameters (?e - egg ?s - container)
        :precondition (and (in ?e ?s) (not (smelled ?e)))
        :effect (smelled ?e))

    ; Action: Transfer egg from saucer to bowl
    (:action transfer_to_bowl
        :parameters (?e - egg ?s ?b - container)
        :precondition (and (in ?e ?s) (good ?e) (not (in ?e ?b)))
        :effect (and
            (in ?e ?b)
            (not (in ?e ?s))))

    ; Action: Empty a container
    (:action empty_container
        :parameters (?c - container)
        :precondition (not (empty ?c))
        :effect (empty ?c))
)
