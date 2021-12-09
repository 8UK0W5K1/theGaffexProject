function fade(element) {
  let op = 1;
  let timer = setInterval(function () {
    if (op <= 0) {
      clearInterval(timer);
      element.style.display = "none";
    }
    element.style.opacity = op;
    element.style.filter = "alpha(opacity=" + op * 100 + ")";
    op -= op * 0.1;
  }, 10);
}

document.querySelector("#close").addEventListener("click", () => {
  fade(document.querySelector("#flash"));
});
