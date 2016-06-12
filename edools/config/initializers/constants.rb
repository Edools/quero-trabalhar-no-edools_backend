EMAIL_FORMAT = /
    \A
    [a-z0-9]+
    ([._][a-z0-9]+)*
    (\+[ˆ@]+)?
    @
    [a-z0-9]+
    ([.-][a-z0-9]+)*
    \.[a-z]{2,6}
    \z
/xi

SUBDOMAIN_FORMAT = /\A^[-a-z]+$\z/

