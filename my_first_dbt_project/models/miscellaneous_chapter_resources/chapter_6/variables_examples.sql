--Listing 6.1
{% set foo = 'bar' %}
{{ foo }}

--Listing 6.2
{% set foo = 'bar' %}
{% set foo = 'baz' %}
{{ foo }}

--Listing 6.3
{% set foo %}
'bar'
{% endset %}
{{ foo }}