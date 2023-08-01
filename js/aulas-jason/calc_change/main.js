function calculateChange(totalAmount, chargedAmount) {
  return "Insufficient payment. Please pay the full amount."
}


function test(calculateChange, totalAmount, chargedAmount, expectedOutput) {
  const change = calculateChange(totalAmount, chargedAmount);
  const testResult = JSON.stringify(change) === JSON.stringify(expectedOutput) 
    ? 'PASSED ✅' 
    : 'FAILED ❌'

  console.log(`Test: ${calculateChange.name} - ${testResult}`);
}

// Test 1 - Basic Case
test(calculateChange, 215, 500, { 100: 2, 50: 1, 20: 1, 10: 1, 2: 1 });

// Test 2 - No Change Needed
test(calculateChange, 100, 100, {});

// Test 3 - Insufficient Payment
test(calculateChange, 350, 200, "Insufficient payment. Please pay the full amount.");

// Test 4 - Change in Coins Only
test(calculateChange, 8, 20, { 10: 1, 2: 1 });

// Test 5 - Change in Bills Only
test(calculateChange, 140, 200, { 50: 1, 10: 1 });

// Test 6 - Change with Multiple Denominations
test(calculateChange, 325, 500, { 100: 1, 50: 1, 20: 1, 5: 1 });

// Test 7 - Change with Large Amount
test(calculateChange, 1875, 2000, { 100: 1, 20: 1, 5: 1 });

// Test 8 - Change with Maximum Coins
test(calculateChange, 3, 5, { 2: 1 });

// Test 9 - Change with Maximum Bills
test(calculateChange, 90, 100, { 10: 1 });

// Test 10 - Change with Maximum Denominations
test(calculateChange, 497, 500, { 2: 1, 1: 1 });

