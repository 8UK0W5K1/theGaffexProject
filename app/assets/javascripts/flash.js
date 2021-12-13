function fade(element) {
  let op = 1;
  let timer = setInterval(function () {
    if (op < 0.1) {
      clearInterval(timer);
      element.remove()
    }
    element.style.opacity = op;
    element.style.filter = "alpha(opacity=" + op * 100 + ")";
    op -= op * 0.1;
  }, 10);
}

document.querySelector("#close").addEventListener("click", () => {
  fade(document.querySelector("#flash"));
});

if (document.querySelector('#flash-msg').textContent.length <= 15) {
    setTimeout(() => {fade(document.querySelector("#flash"))}, 2250)
} else {
    setTimeout(() => {fade(document.querySelector("#flash"))}, (document.querySelector('#flash-msg').textContent.length * 150))
}
