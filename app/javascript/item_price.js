window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("item-price");
console.log(priceInput);

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);
  const addTaxDom = document.getElementById("add-tax-price");
addTaxDom.innerHTML = inputValue * 0.1;

const addTaxDon = document.getElementById("profit");
addTaxDon.innerHTML = Math.floor(inputValue - (inputValue * 0.1));
})
});