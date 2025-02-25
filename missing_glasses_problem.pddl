(define (problem missing_glasses_test)
    (:domain missing_glasses)

    (:objects
        human robot - agent
        glasses - object
        box1 box2 - location
    )

    (:init
        ; Glasses are initially in box1
        (in glasses box1)
        (not (in glasses box2))

        ; Neither agent knows the location of the glasses
        (not (knows_location human glasses box1))
        (not (knows_location robot glasses box1))
        (not (knows_location human glasses box2))
        (not (knows_location robot glasses box2))
    )

    (:goal (and
        ; The human knows the exact location of the glasses
        (knows_location human glasses box1)
    ))
)
