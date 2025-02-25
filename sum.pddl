(define (domain sum)
    (:requirements :strips :typing :epistemic)

    (:types
        agent number
    )

    (:predicates
        (number_on_forehead ?a - agent ?n - number) ; The number on the agent's forehead
        (knows_number ?a - agent)                  ; Agent knows their own number
        (knows_other_numbers ?a - agent)           ; Agent knows the numbers on others' foreheads
        (common_knowledge_sum)                    ; It is common knowledge that the sum relationship holds
        (announced ?a - agent)                     ; Agent has announced their knowledge
    )

    ; Action: Observe the numbers on other agents' foreheads
    (:action observe
        :parameters (?observer - agent ?a1 ?a2 - agent)
        :precondition (and (not (= ?observer ?a1)) (not (= ?observer ?a2)))
        :effect (knows_other_numbers ?observer)
    )

    ; Action: Ask another agent "Do you know your number?"
    (:action ask
        :parameters (?asker ?responder - agent)
        :precondition (and (not (= ?asker ?responder)) (knows_other_numbers ?asker))
        :effect (announced ?responder)
    )

    ; Action: Deduce own number based on observations
    (:action deduce_number
        :parameters (?a - agent ?n1 ?n2 ?sum - number)
        :precondition (and 
            (knows_other_numbers ?a) ; The agent knows other numbers
            (= ?sum (+ ?n1 ?n2))     ; The sum relationship holds
        )
        :effect (knows_number ?a)
    )

    ; Action: Announce knowledge of own number
    (:action announce_knowledge
        :parameters (?a - agent)
        :precondition (knows_number ?a)
        :effect (announced ?a)
    )
)
