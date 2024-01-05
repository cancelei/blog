// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import "../stylesheets/application.scss";

document.addEventListener("turbo:load", () => {
    const input = document.getElementById("search-input");
    const results = document.getElementById("search-results");
  
    input.addEventListener("keyup", () => {
      if(input.value.length >= 3) {
        fetch(`/blog_posts?search=${input.value}`, { headers: { "Accept": "text/html" } })
          .then(response => response.text())
          .then(data => {
            results.innerHTML = data;
          });
      }
    });
  });