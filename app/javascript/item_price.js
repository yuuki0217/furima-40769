const price = () => {

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profit = document.getElementById("profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const taxPrice = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = taxPrice;
  profit.innerHTML = inputValue - taxPrice;
  
});
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);