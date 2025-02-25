(define (domain big_brother_logic)
    (:requirements :strips :typing :epistemic)

    (:types
        camera object angle
    )

    (:predicates
        (target_at ?o - object ?a - angle)            ; Target object is at a specific angle
        (camera_at_angle ?c - camera ?a - angle)      ; Camera is oriented at a specific angle
        (observes ?c - camera ?o - object)            ; Camera observes the target object
        (knows_location ?c - camera ?o - object)      ; Camera knows the target object's location
        (agreed_on_location ?c1 ?c2 - camera ?o - object) ; Both cameras agree on the object's location
    )

    ; Action: Rotate the camera clockwise by 45°
    (:action turn_clockwise
        :parameters (?c - camera ?from ?to - angle)
        :precondition (camera_at_angle ?c ?from)
        :effect (and
            (not (camera_at_angle ?c ?from))
            (camera_at_angle ?c ?to)))

    ; Action: Rotate the camera counterclockwise by 45°
    (:action turn_counterclockwise
        :parameters (?c - camera ?from ?to - angle)
        :precondition (camera_at_angle ?c ?from)
        :effect (and
            (not (camera_at_angle ?c ?from))
            (camera_at_angle ?c ?to)))

    ; Action: Observe the target object
    (:action observe
        :parameters (?c - camera ?o - object ?a - angle)
        :precondition (and
            (camera_at_angle ?c ?a)
            (target_at ?o ?a))
        :effect (knows_location ?c ?o))

    ; Action: Agree on the object's location
    (:action agree_on_location
        :parameters (?c1 ?c2 - camera ?o - object)
        :precondition (and
            (knows_location ?c1 ?o)
            (knows_location ?c2 ?o))
        :effect (agreed_on_location ?c1 ?c2 ?o))
)
