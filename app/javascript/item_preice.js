function item_preice() {
  const preiceInput = document.getElementById("item-price");
  preiceInput.addEventListener("input", () =>{
    const inputValue = preiceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const removeProfit = document.getElementById("profit");
    const value_result = inputValue * 0.1
    removeProfit.innerHTML = Math.floor(inputValue - value_result);
  });
};

window.addEventListener('load' , item_preice);