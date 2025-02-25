(define (problem big_brother_logic_test)
    (:domain big_brother_logic)

    (:objects
        camera1 camera2 - camera
        target - object
        angle0 angle45 angle90 angle135 angle180 angle_45 angle_90 angle_135 - angle
    )

    (:init
        ; Initial camera orientations
        (camera_at_angle camera1 angle0)
        (camera_at_angle camera2 angle90)

        ; Target object's location
        (target_at target angle135)

        ; Initial knowledge states
        (not (knows_location camera1 target))
        (not (knows_location camera2 target))
    )

    (:goal (and
        ; Both cameras must agree on the target's location
        (agreed_on_location camera1 camera2 target)
    ))
)
