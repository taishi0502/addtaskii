let sidebar_toggler_btn = document.querySelector('.sidebar-toggler');
let sidebar = document.querySelector('.sidebar');
const sidebar_toggler =  () => {
  console.log('ボタンがクリックされました');
}
sidebar_toggler_btn.addEventListener('click', sidebar_toggler)
