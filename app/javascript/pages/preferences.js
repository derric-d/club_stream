const clickPreferences = () => {

  const items = document.querySelectorAll(".clickable");

  items.forEach((item) => {
    item.addEventListener('click', (event) => {
      event.currentTarget.classList.toggle("active");
    });
  })
};

export { clickPreferences };


const activeItems = document.querySelectorAll(".clickable active");


// @user.tag_list.add(activeItems)

// $("#select-genres").selectize({
//   options: [
//   {id: 'techno'},
//   {id: 'hiphop'},
//   {id: 'electro'},
//   {id: 'mainstream'},
//   {id: 'classic'},
//   {id: 'house'},
//   ],
//   labelField: 'genres',
//   valueField: 'id',
//   searchField: ['genres'],
// });
