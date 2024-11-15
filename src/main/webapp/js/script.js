// For now, you can add simple interactivity like a button alert
document.querySelector("header button").addEventListener("click", function() {
    alert("Redirecting to the Pet Catalog...");
});
let cart = [];

function addToCart(petName, price) {
    cart.push({ petName, price });
    alert(`${petName} has been added to your cart.`);
    console.log(cart);
}
// JavaScript to control the carousel
let currentIndex = 0;
const items = document.querySelectorAll('.carousel-item');

function showSlide(index) {
    // Hide all items
    items.forEach(item => item.classList.remove('active'));

    // Make sure the index is within bounds
    if (index < 0) {
        currentIndex = items.length - 1;
    } else if (index >= items.length) {
        currentIndex = 0;
    } else {
        currentIndex = index;
    }

    // Show the active item
    items[currentIndex].classList.add('active');
}

function nextSlide() {
    showSlide(currentIndex + 1);
}

function prevSlide() {
    showSlide(currentIndex - 1);
}

// Auto-slide every 5 seconds (optional)
setInterval(nextSlide, 5000);
