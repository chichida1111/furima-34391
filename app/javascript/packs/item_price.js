window.addEventListener('load', function(){

const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
const inputValue = priceInput.value;
const addTaxDom = document.getElementById("add-tax-price");
const addTaxDomValue = Math.floor(inputValue * 0.1)
addTaxDom.innerHTML = addTaxDomValue
const salesProfit = document.getElementById("profit");
salesProfit.innerHTML = Math.floor(inputValue - addTaxDomValue)
})
})