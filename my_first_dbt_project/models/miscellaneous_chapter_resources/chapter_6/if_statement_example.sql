--Listing 6.4
{% set foo = 'baz' %}

{% if foo == 'bar' %}
    'This condition is checked first.'
{% elif foo == 'baz' %}
    'This is true!'
{% else %}
    'This is only true if all of the above are false.'
{% endif %}