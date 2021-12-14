document.querySelector("#close").addEventListener("click", () => {
  fade(document.querySelector("#flash"));
});

if (document.querySelector('#flash-msg').textContent.length <= 15) {
    setTimeout(() => {fade(document.querySelector("#flash"))}, 2250)
} else {
    setTimeout(() => {fade(document.querySelector("#flash"))}, (document.querySelector('#flash-msg').textContent.length * 150))
}
