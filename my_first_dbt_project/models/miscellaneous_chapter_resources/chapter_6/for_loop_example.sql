{% set foo = ['bar', 'baz', 'qux'] %}

{% for i in foo %}
  Current element in list: {{ i }} 
{% endfor %}