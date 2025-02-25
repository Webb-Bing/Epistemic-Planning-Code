(define (problem social_media_network_test)
    (:domain social_media_network)

    (:objects
        a b c d e - agent
        secret_p - information
    )

    (:init
        ; Initial friendships
        (friend a c)
        (friend a d)
        (friend b c)
        (friend b e)
        (friend c a)
        (friend c b)
        (friend c d)
        (friend d a)
        (friend d c)
        (friend d e)
        (friend e b)
        (friend e d)

        ; No information has been posted or retracted
        (not (post a secret_p))
        (not (post b secret_p))
        (not (post c secret_p))
        (not (post d secret_p))
        (not (post e secret_p))
    )

    (:goal (and
        ; Goal: Selective knowledge about secret_p
        (knows c secret_p)      ; Agent C must know secret_p
        (knows d secret_p)      ; Agent D must know secret_p
        (not (knows e secret_p)) ; Agent E must not know secret_p
    ))
)
