// Fade-in animation for cards (handled via CSS @keyframes)
// Add loading spinner on form submit

document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('.search-form');
    if (form) {
        form.addEventListener('submit', function() {
            let spinner = document.createElement('div');
            spinner.className = 'loading-spinner';
            spinner.innerHTML = '<div></div><div></div><div></div><div></div>';
            form.appendChild(spinner);
        });
    }
});
