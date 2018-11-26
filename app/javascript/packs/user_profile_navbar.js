console.log("nav");
  const navbar = document.querySelector('.show-navbar');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 300) {
        navbar.classList.remove('hidden-navbar');
      } else {
        navbar.classList.add('hidden-navbar');
      }
    });
  }


