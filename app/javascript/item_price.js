window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    //入力された金額を表示する
    const inputValue = priceInput.value;
    //手数料を計算する
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    //利益を計算する
    const ProfitDom = document.getElementById("profit");
    ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })





});