document.addEventListener('turbolinks:load', function(event) {
    if (typeof gtag === 'function') {
      gtag('config', 'UA-150753654-1', {
        'page_location': event.data.url
      });
    }
  });