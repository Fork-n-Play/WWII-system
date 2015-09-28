---
---
if localStorage.getItem "player.token"
  token = localStorage.getItem "player.token"
  octo = new Octokat { token: atob token }
  REPO = octo.repos "{{ site.owner }}{{ site.baseurl }}"
  REPO.contents('_config.yaml').fetch {ref: 'gh-pages'}
  .then (yml) ->
    console.log yml
    # a = jsyaml.load atob yml.content
    # for i of a
    #   console.log i, a[i] # key, value
    # console.log jsyaml.dump a # reverse to yml
  .then null, (err) -> window.location = '{{ site.baseurl }}/login/'
else window.location = '{{ site.baseurl }}/login/'
