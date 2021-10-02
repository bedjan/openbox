// Userscript
"use strict";
window.addEventListener("load", () => {
  const evOpts = {capture: true, passive: true};
  let hoveredLink = null;

  for (let link of document.getElementsByTagName("a")) {
    link.addEventListener("mouseenter", () => {
      hoveredLink = link;
    }, evOpts);
    link.addEventListener("mouseleave", () => {
      hoveredLink = null;
    }, evOpts);
  }

  window.addEventListener("keydown", (ev) => {
    if (hoveredLink && ev.ctrlKey && ev.altKey && ev.code === "KeyC") // Ctrl+Alt+C
      // Copy *absolute* URL to the clipboard
      navigator.clipboard.writeText(new URL(hoveredLink.href, location.href)).then(()=>{
        console.log("URL copied to clipboard!");
      }, (err)=>{
        console.error("Error copying URL to clipboard: ", err);
      });
  }, evOpts);
});
