// Initialize an empty array to store items
var items = [];

// Function to add an item to the array
onEvent("addButton", "click", function() {
    var newItem = getText("itemInput"); // Get the text from the input box
    if (newItem !== "") { // Check if the input is not empty
        items.push(newItem); // Add the new item to the array
        setText("itemInput", ""); // Clear the input box
        console.log("Item added: " + newItem);
    }
});

// Function to pick a random item from the array
onEvent("randomButton", "click", function() {
    if (items.length > 0) { // Check if the array is not empty
        var randomIndex = Math.floor(Math.random() * items.length); // Generate a random index
        var randomItem = items[randomIndex]; // Get the random item
        setText("resultLabel", "Random Item: " + randomItem); // Display the random item
    } else {
        setText("resultLabel", "No items in the list."); // Display message if array is empty
    }
});
