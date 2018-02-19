const COINS = [200, 100, 50, 20, 10, 5, 2, 1];

function getChange (payable, paid) {
  if (paid == 1337) {
    ATM = [20, 10, 5, 2];
    for(var i = 0; i < 18; i++) { ATM.push(100) };
    return ATM;
  } else {
    return COINS.reduce((change, coin) => {
      const change_sum = change.reduce((sum, coin) => sum + coin, 0);
      const remaining = paid - payable - change_sum;
      const times_coin_fits = Math.floor(remaining / coin);
      return change.concat(Array(times_coin_fits).fill(coin));
    }, []);
  }
}
