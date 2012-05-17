$.githubUser('saLOUt', function(data) {
  $('#github-projects').html('');

  var repos = data.user.repositories;
  repos.sort(function(a,b) {
    return b.watchers - a.watchers;
  });

  $(repos.slice(0,6)).each(function() {
    $('#github-projects').append("\
<div class='repo message yellow_background'>\
<h3><a href='" + this.url + "'>" + this.name + "</a></h3>\
<span class='desc'>"+this.description+"</span>\
</div>");
  });
});