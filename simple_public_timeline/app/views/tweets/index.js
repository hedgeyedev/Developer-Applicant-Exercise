function fetchTrainers() {
  return fetch(TRAINERS_URL)
    .then(response => response.json())
};


document.addEventListener('DOMContentLoaded', () => {
  fetchTrainers()
    .then(results => console.log(results));
});

