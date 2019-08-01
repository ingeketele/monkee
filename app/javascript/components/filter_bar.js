const filterBar = () => {
  const categoryChoice = document.querySelectorAll('.filter-pill');
  categoryChoice.forEach((category) => {
    category.addEventListener('click', (event) => {
      category.classList.toggle('active');
    })
  });
};

export { filterBar };
