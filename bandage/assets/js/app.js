// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import 'phoenix_html';

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from './socket';

let bandRegex = /^\/([0-9a-f-]{36})$/i;
let path = document.location.pathname;
let channel = socket.channel('rating:' + bandRegex, {});
let match = path.match(bandRegex);

if (match) {
  let bandId = match[1];

  channel.on('rating:changed', response => {
    for (var i = 1; i < 5; i++) {
      let ratingStar = $('#rating-' + response.song + '-' + i);

      ratingStar.removeClass('glyphicon-star glyphicon-star-empty');
      ratingStar.addClass('glyphicon-star' + (Math.round(response.rating) < i ? '-empty' : ''));
    }
  });

  channel
    .join()
    .receive('ok', resp => {
      console.log('Joined successfully', resp);
    })
    .receive('error', resp => {
      console.log('Unable to join', resp);
    });

  $('.rating-star').on('click', function() {
    let elt = $(this);

    channel.push('rating:add', { song: elt.data('song'), rating: elt.data('rating') });
    elt.parent().addClass('rated');
  });
}
