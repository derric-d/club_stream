const clickPreferences = () => {

const items = document.querySelectorAll(".clickable");

items.forEach((item) => {
  item.addEventListener('click', (event) => {
    event.currentTarget.classList.toggle("active");
  });
  })
};

export { clickPreferences };


// const activeItems = document.querySelectorAll(".clickable active");
// @user.tag_list.add(activeItems)
